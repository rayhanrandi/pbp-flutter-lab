# Tugas 8: Flutter Form

### 1. `Navigator.push` vs `Navigator.pushReplacement`
Singkatnya, `Navigator.push` berfungsi untuk me-routing user ke halaman baru yang telah di-push. Pengguna lalu dapat kembali lagi ke halaman yang sebelumnya dikunjungi dengan `Navigator.pop`. Beda halnya dengan `Navigator.pushReplacement`, command ini melakukan push juga untuk me-routing user ke halaman yang baru, namun command akan menghilangkan stack halaman yang berada di bawahnya, hingga secara tidak langsung mengganti halaman lama ke halaman baru, bukan menibannya seperti apa yang dilakukan `.push`.

### 2. Penggunaan _Widgets_
Dasarnya, penggunaan _widget_ masih sama seperti dengan tugas lalu, namun ditambah beberapa untuk membuat form dan menampilkannya seperti:

- **Form**: Untuk menampung elemen fields yang akan diisi pengguna dan disimpan, mirip seperti container namun untuk field-field pada form.
- **Card**: Sebagai container untuk menampung data hasil input field yang akan ditampilkan.
- **TextFormField**: Untuk menampilkan field yang dapat diisi oleh teks dan disimpan isinya.
- **DropdownButtonFormField**: Untuk menu dropdown yang berisi pilihan input bagi pengguna yang dapat disimpan pilihannya.
- **ListTile**: Data yang disimpan diletakkan dalam widget ini dan widget ini lalu diletakkan dalam cards, digunakan untuk meletakkan data sesuai dengan siginifikansinya yaitu title, subtitle, trailing, dll.


### 3. _Events_ pada Flutter
`onPressed`: trigger event berdasarkan bila sebuah tombol/button ditekan.
`onSaved`: trigger event berdasarkan bila sebuah form/field dijalankan .method `.save()`.
`onChanged`: trigger event berdasarkan perubahan pada value dari sebuah field.
`onTap`: trigger event berdasarkan sentuhan dari user.
`onEditingComplete`: trigger event berdasarkan bila user men-submit sesuatu yang dapat diubah-ubah, contohnya memencet "done" pada keyboard.

### 4. Mengganti halaman dengan `Navigator`
Navigator dapat mengganti halaman dengan memanfaatkan stack yang berisi route dari halaman-halaman yang dikunjungi. Stack yang berisi route tersebut dapat diubah-ubah dengan `.pop` dan `.push`, dan halaman yang akan ditampilkan adalah route teratas yang ada dalam stack. Ketika terjadi `.pop`, maka halaman teratas akan dihilangkan dan app akan menampilkan halaman teratas yang baru. Jika terjadi `.push` maka route baru akan masuk ke stack paling atas sehingga akan ditampilkan.

### 5. Implementasi
Pengimplementasian app ini pertama dilakukan dengan membuat 2 file baru yang dapat dinavigasi yaitu `databudget.dart` dan `budgetform.dart`. Selain itu, dibuat juga 1 file yang berisi class dari data yang akan disimpan, yaitu `budgetmodel.dart`. Langkah selanjutnya adalah membuat form pada `databudget.dart` menggunakan widget `TextFormField` dan `DropdownFormField` yang akan diambil inputnya untuk diinstansiasi menjadi sebuah object Budget saat user memencet tombol simpan. Object tersebut disimpan di `databudget.dart` dalam sebuah `List<Budget>`, yang dimana pada file/halaman tersebut, List akan diiterasi untuk menampilkan budget-budget yang telah dibuat pengguna. Hal tersebut dilakukan dengan membuat widget `Card` berisi `ListTile` yang menampung data dari setiap object budget yang ditampilkan untuk tiap iterasi dari List.

<br></br>
###### *Rayhan Putra Randi - 2106705644 - PBP A*