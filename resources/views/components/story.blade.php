@props(['story'])

<div class="story">
    @if ($story->type == 'text')
        <p>{{ $story->content }}</p>
    @elseif($story->type == 'image')
        <img src="{{ asset('storage/' . $story->content) }}" alt="story image" width="200">
    @elseif($story->type == 'video')
        <video width="200" controls>
            <source src="{{ asset('storage/' . $story->content) }}" type="video/mp4">
        </video>
    @endif
    <p><strong>{{ $story->user->name }}</strong></p>
</div>
