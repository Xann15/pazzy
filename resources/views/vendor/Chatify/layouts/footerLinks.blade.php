<script src="https://js.pusher.com/7.2.0/pusher.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script>
<script>
    // Gloabl Chatify variables from PHP to JS
    window.chatify = {
        name: "{{ config('chatify.name') }}",
        sounds: {!! json_encode(config('chatify.sounds')) !!},
        allowedImages: {!! json_encode(config('chatify.attachments.allowed_images')) !!},
        allowedFiles: {!! json_encode(config('chatify.attachments.allowed_files')) !!},
        maxUploadSize: {{ Chatify::getMaxUploadSize() }},
        pusher: {!! json_encode(config('chatify.pusher')) !!},
        pusherAuthEndpoint: '{{ route('pusher.auth') }}'
    };
    window.chatify.allAllowedExtensions = chatify.allowedImages.concat(chatify.allowedFiles);

    // Tambahkan AudioContext untuk menghindari NotAllowedError
    window.chatify.audioContext = new(window.AudioContext || window.webkitAudioContext)();
    window.chatify.notificationSound = new Audio(chatify.sounds.notification);

    document.addEventListener("DOMContentLoaded", function() {
        var welcomeScreen = document.getElementById("welcome-screen");
        var welcomeSound = new Audio("/sounds/chatify/welcome-sound.mp3");

        // Cek apakah welcome screen sudah muncul sebelumnya di localStorage
        if (localStorage.getItem("welcomeShown")) {
            welcomeScreen.style.display = "none"; // Langsung sembunyikan jika sudah pernah muncul
        } else {
            // Event untuk menutup welcome screen saat ditekan
            function hideWelcomeScreen() {
                welcomeScreen.classList.add("hidden");

                // Pastikan hanya memutar sound jika welcome screen pertama kali muncul
                if (!localStorage.getItem("welcomeShown")) {
                    welcomeSound.play().catch(error => console.warn("Autoplay failed:", error));
                    localStorage.setItem("welcomeShown", "true"); // Simpan status di localStorage
                }

                // Hapus welcome screen setelah animasi selesai
                setTimeout(() => {
                    welcomeScreen.style.display = "none";
                    document.removeEventListener("click", hideWelcomeScreen);
                }, 1000);
            }

            document.addEventListener("click", hideWelcomeScreen);
        }
    });
</script>
<script src="{{ asset('js/chatify/utils.js') }}"></script>
<script src="{{ asset('js/chatify/code.js') }}"></script>
