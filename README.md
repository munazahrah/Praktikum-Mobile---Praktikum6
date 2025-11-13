# Praktikum 6

Project Modul 6 - Menampilkan Data API dengan ListView.builder

📖 Deskripsi

Project ini adalah lompatan besar dari modul sebelumnya. Anda tidak lagi membuat layout statis, melainkan akan mengambil data real-time dari internet menggunakan sebuah API publik (FreeToGame).

Fokus utamanya adalah mempelajari cara membuat HTTP request untuk mendapatkan data (dalam format JSON), mem-parsing data tersebut, dan menampilkannya dalam sebuah daftar (list) yang efisien menggunakan ListView.builder.

🎯 Tujuan Utama Project

Request Data API: Mampu membuat HTTP request (GET) ke sebuah API publik (FreeToGame) untuk mengambil data.

Manajemen Data: Menyimpan data yang didapat dari API (dalam format JSON) ke dalam sebuah List di dalam state aplikasi.

List Dinamis: Menguasai penggunaan ListView.builder untuk merender daftar/list yang panjang secara efisien (hanya merender item yang terlihat di layar).

UI Data: Membuat widget kustom (_listItem) untuk menampilkan informasi spesifik (judul, genre, platform) dari setiap item data.

✅ Daftar Tugas (To-Do List)

Berikut adalah hal-hal yang harus Anda kerjakan berdasarkan modul:

Buat Project Baru:

[ ] Buat "New Flutter Project" (misalnya dengan nama game_api_list).

Tambahkan Dependency (Penting!):

[ ] Buka file pubspec.yaml.

[ ] Tambahkan package http di bawah dependencies:. (Anda akan membutuhkannya untuk membuat HTTP request).

[ ] Jalankan flutter pub get.

Buat Fungsi Pengambil Data (_ambilData):

[ ] Buat sebuah fungsi asynchronous (misal: _ambilData() async).

[ ] Di dalam fungsi ini, gunakan http.get() untuk mengambil data dari API FreeToGame.

[ ] Cek response status code (pastikan 200 OK).

[ ] Decode data JSON yang diterima.

[ ] Simpan 20 data pertama dari hasil response ke dalam sebuah List (variabel state).

Buat Fungsi Tampilan Item (_listItem):

[ ] Buat sebuah widget (bisa berupa fungsi atau class) bernama _listItem.

[ ] Widget ini harus menerima satu objek data game sebagai parameter.

[ ] Kembalikan sebuah widget (misalnya ListTile atau Card) yang menampilkan:

Judul Game (title)

Genre Game (genre)

Platform Game (platform)

Tampilkan di UI (ListView.builder):

[ ] Di dalam body Scaffold Anda, gunakan ListView.builder.

[ ] Atur itemCount agar sesuai dengan jumlah data yang Anda simpan (misalnya 20).

[ ] Di dalam itemBuilder, panggil fungsi _listItem Anda dan berikan data game sesuai dengan index yang sedang dibangun.

[ ] (Opsional tapi disarankan: Tampilkan loading indicator saat data sedang diambil).
