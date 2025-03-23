<form id="storyForm" enctype="multipart/form-data">
    @csrf
    <label for="storyType">Pilih Tipe Story:</label>
    <select id="storyType" name="type" required onchange="toggleInputs()">
        <option value="text">Teks</option>
        <option value="image">Gambar</option>
        <option value="video">Video</option>
    </select>

    <div id="textInput">
        <label for="textContent">Tulis Story:</label>
        <textarea id="textContent" name="content"></textarea>
    </div>

    <div id="fileInput" style="display: none;">
        <label for="fileContent">Upload File:</label>
        <input type="file" id="fileContent" name="file" accept="image/*,video/*">
    </div>

    <button type="submit">Upload Story</button>
</form>

<div id="message"></div>

<script>
    function toggleInputs() {
        let type = document.getElementById('storyType').value;
        document.getElementById('textInput').style.display = (type === 'text') ? 'block' : 'none';
        document.getElementById('fileInput').style.display = (type === 'text') ? 'none' : 'block';
    }

    document.getElementById('storyForm').addEventListener('submit', function(e) {
        e.preventDefault();

        let formData = new FormData(this);

        fetch("{{ url('/api/story/upload') }}", { // Pastikan URL benar
                method: "POST",
                body: formData,
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute(
                        'content'),
                    'Authorization': 'Bearer {{ auth()->user()->createToken('storyToken')->plainTextToken }}'
                }
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('message').innerHTML =
                    `<p style="color: green;">${data.message}</p>`;
                this.reset();
                toggleInputs();
            })
            .catch(error => {
                document.getElementById('message').innerHTML =
                    `<p style="color: red;">Terjadi kesalahan, coba lagi.</p>`;
            });
    });
</script>
