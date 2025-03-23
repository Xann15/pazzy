<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Story;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class StoryController extends Controller
{
    /**
     * Menampilkan semua story aktif
     */
    public function index()
    {
        $stories = Story::where('expires_at', '>', now())->latest()->get();

        return response()->json([
            'stories' => $stories
        ], 200);
    }

    /**
     * Menyimpan story baru
     */
    public function store(Request $request)
    {
        Log::info('Request diterima', ['data' => $request->all()]);
        Log::info('File upload info', [
            'exists' => $request->hasFile('file'),
            'is_valid' => $request->file('file') ? $request->file('file')->isValid() : false,
        ]);
        

        $request->validate([
            'type' => 'required|in:image,video,text',
            'content' => 'required_if:type,text|string',
            'file' => 'required_if:type,image,video|file|mimes:jpg,jpeg,png,mp4,mov|max:20480',
        ]);


        Log::info('Request berhasil divalidasi');

        if (!$request->hasFile('file')) {
            Log::error('File tidak ditemukan dalam request');
            return response()->json(['message' => 'No file uploaded'], 400);
        }

        $file = $request->file('file');

        if (!$file->isValid()) {
            Log::error('File upload tidak valid');
            return response()->json(['message' => 'Invalid file upload'], 400);
        }

        try {
            $fileName = Str::uuid() . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('stories', $fileName, 'public');

            Log::info('File berhasil disimpan', ['path' => $path]);

            $story = Story::create([
                'user_id' => Auth::id(),
                'type' => $request->type,
                'content' => $path,
                'expires_at' => now()->addHours(24)
            ]);

            Log::info('Story berhasil disimpan', ['story' => $story]);
            Log::info('File diterima', ['file' => $file->getClientOriginalName(), 'tmp_path' => $file->getPathname()]);

            return response()->json(['message' => 'Story berhasil ditambahkan!', 'story' => $story], 201);
        } catch (\Exception $e) {
            Log::error('Terjadi kesalahan saat menyimpan story', ['error' => $e->getMessage()]);
            return response()->json(['message' => 'Upload gagal', 'error' => $e->getMessage()], 500);
        }
    }


    /**
     * Menghapus story
     */
    public function destroy($id)
    {
        $story = Story::where('id', $id)->where('user_id', Auth::id())->first();

        if (!$story) {
            return response()->json(['message' => 'Story tidak ditemukan'], 404);
        }

        if ($story->type != 'text') {
            Storage::disk('public')->delete($story->content);
        }

        $story->delete();

        return response()->json(['message' => 'Story berhasil dihapus'], 200);
    }
}
