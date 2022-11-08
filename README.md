# Tugas 7: counter_7

### 1. _Stateless_ dan _Stateful Widgets_
_*Stateless Widget*_ merupakan _widget_ yang dimana keadaan (teks, data, dll.) dalam widget tidak dapat berubah setelah _widget_ pertamakali dibuat oleh program. _*Stateless Widget*_ berguna jika sebuah _user interface_ tidak bergantung kepada apapun selain data yang dimasukkan saat pembuatan _widget_. Sementara itu, _Stateful Widget_ merupakan kebalikan dari _Stateless Widget_, dimana keadaan dalam sebuah _Stateful Widgets_ dapat berubah-ubah setelah inisiasi program sesuai dengan alur program dan tiap variabel, input, atau data yang berbeda-beda. Sama seperti pengertiannya, _Stateful Widgets_ berguna jika bagian dari _user interface_ yang ingin dibuat dapat berubah secara dinamis sesuai jalannya program.

**_Stateless_ vs _Stateful Widgets_**

|  _Stateless_  |   _Stateful_  |
| ------------- | ------------- |
| Statis  | Dinamis  |
| Tidak bergantung kepada perubahan data ataupun alur program  | Bergantung kepada perubahan data atau perubahan alur program  |
| Tidak memiliki _state_, setelah di-_render_ tidak akan berubah kecuali terdapat perubahan pada data eksternal  | Memiliki _state_ dan dapat di-_render_ ulang bila terdapat perubahan data atau _widget state_ berubah |

### 2. Penggunaan _Widgets_
- **Scaffold**: Merupakan dasar dari _interface_, tempat dimana _widget_ lain distruktur menjadi satu.
- **AppBar**: Tempat dimana _title_ dari program ditampilkan.
- **Text**: Untuk menampilkan tipe bilangan serta _title_ dari program.
- **Column**: **Column** digunakan untuk menyusun tipe bilangan serta angka yang akan ditampilkan.
- **Center**: Digunakan untuk menampilkan kolom berisi tipe bilangan serta angkanya di tengah layar.
- **Theme**: Menentukan tema warna dari app.
- **Container**: Sebuah _widget_ untuk membungkus _widget_-_widget_ lain yang dapat diubah-ubah propertinya seperti `<div>` pada HTML.
- **Icon**: Untuk tanda dari tombol yang akan dibuat.
- **FloatingActionButton**: Untuk membuat dua tombol yang dapat di-_map_ ke sebuah fungsi masing-masing yaitu _increment_ dan _decrement_ untuk mengubah _counter_.
- **Row**: Digunakan untuk menempatkan kedua tombol tadi pada satu baris yang akan diletakkan pada bawah kiri dan kanan app.
- **Visibility**: _Widget_ ini digunakan untuk membuat fungsionalitas tombol _decrement_ yang hilang apabila _counter_ = 0.

### 3. `setState()`
Singkatnya, `setState` berfungsi untuk membuat kembali app jika terdapat perubahan pada data-datanya agar app bisa menampilkan data kepada pengguna sesuai dengan _value_ yang telah di-_update_. Variabel yang dapat terdampak dengan fungsi tersebut adalah variabel `_counter` dan variabel tempat menyimpan _widget_ `Text` yang akan berubah seiring dengan perubahan `_counter`.

### 4. `const` dan `final`
`const` merupakan _keyword_ yang dapat di-_assign_ ke sebuah object jika kita tau apa _value_ dari object saat _compile time_. Contohnya, untuk `new DateTime.now()`, kita tidak bisa menggunakan `const` karena kita tidak tau berapa _value_-nya ketika app di-_compile_, sementara itu, `const a = 1` merupakan penggunaan yang benar karena kita tahu pasti bahwa a = 1.

`final` merupakan _keyword_ yang dapat di-_assign_ ke sebuah object jika kita **tidak tau** _value_-nya saat _compile time_. Untuk contoh yang tadi, `final` dapat digunakan karena `new DateTime.now()` tidak tentu _value_-nya.

### 5. Implementasi
Pengimplementasian app ini dilakukan dengan memodifikasi sedikit program demo bawaan flutter. Modifikasi yang dilakukan adalah membuat sebuah function baru yaitu `_decrementCounter()`, untuk men-_decrement_ counter dan `_counterCheck()` untuk menampilkan _widget_ `Text` yang sesuai dengan counter menggunakan if-else statement. Selanjutnya, dibuat dua _widget_ `FloatingActionButton` yang dimasukkan ke dalam sebuah _widget_ `Row` yang dimana kedua _widget_ tersebut berada dalam `Scaffold`. Untuk tombol _decrement_, dimasukkan ke dalam _widget_ `Visibility` agar dapat dibuat fungsionalitas tombol yang tidak ditampilkan ketika _counter_ bernilai 0.

<br></br>
###### *Rayhan Putra Randi - 2106705644 - PBP A*
