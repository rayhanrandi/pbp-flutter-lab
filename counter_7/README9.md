# Tugas 9: Integrasi Web Service pada Flutter

### 1. Pengambilan JSON dengan model dan tanpa model
Pengambilan data JSON dapat dilakukan tanpa membuat sebuah class model dengan memanggil fungsi `jsonDecode()`, dimana cara ini dinamakan _inline JSON Serializing_. Fungsi tadi akan mengembalikan sebuah `Map<String, dynamic>` yang dimana berarti kita tidak akan tau tipe data yang didapat sebelum runtime. Hal tersebut membuat kode menjadi rentan terhadap error karena akan hilang sifat _type safety_, _autocompletion_, dan _compile-time exceptions_ bisa tidak terdeteksi. Maka dari itu, pengambilan data JSON sebaiknya dilakukan menggunakan class Model agar berbagai kerentanan error dapat dihindari.

### 2. Penggunaan _Widgets_
Dasarnya, penggunaan _widget_ masih sama seperti dengan tugas lalu, namun ditambah beberapa untuk membuat form dan menampilkannya seperti:

- **FutureBuilder**: Digunakan untuk membuat berbagai _widget_ lain dan menampilkannya berdasarkan interaksi sebuah `Snapshot` dengan sebuah `Future`. Singkatnya, _widget_ ini membantu kita dalam menjalankan sebuah asynchronous function dan menampilkan berbagai _widget_ berdasarkan return dari asynchronous function tersebut.
- **InkWell**: Widget ini digunakan agar tiap `ListView` dari film-film yang ada dapat ditekan dan me-route action onTap ke halaman yang menampilkan detail dari film. 
- **RichText**: _Widget_ ini dasarnya mirip dengan `Text` biasa, namun memiliki berbagai kelebihan yang dapat dimanfaatkan untuk mengubah gaya penulisan text.
- **TextSpan**: `TextSpan` ini merupakan children dari `RichText` tadi, dimana _widget_ ini dimanfaatkan untuk mengubah gaya penulisan hanya pada sebagian text saja.

### 3. Mekanisme pengambilan data JSON
Pertama, app akan melakukan pengambilan data JSON yang telah ada di internet menggunakan `http.get()` yang akan mengambil data sesuai dengan url yang menjadi parameter function tersebut, dimana pada kasus ini, parameter berisi link url yang menyimpan isi dari data JSON yang ingin diambil. Lalu, app akan men-decode data yang didapat menjadi bentuk JSON dengan `jsonDecode()` lalu akan mengiterasi tiap data tadi dan mengkonversinya menjadi object `Movie` sesuai class yang telah dibuat menggunakan function `Movie.fromJSON()`, dan tiap object Movie yang telah dibuat akan dimasukkan dalam sebuah list.

### 4. Implementasi
Pertama, dibuat sebuah file yang akan berisi class `Movie` sesuai dengan fields-fields yang ada pada JSON yang ingin diambil menggunakan Quicktype seperti pada tutorial. Lalu, code yang dihasilkan dimasukkan dalam sebuah file baru yang akan menjadi model dari object yang akan diambil. Setelah itu, dibuat dua halaman beserta routingnya yang akan digunakan untuk menampilkan data JSON, yang pertama untuk menampilkan daftar film-film yang ada dan yang satunya untuk menampilkan detail film yang dipilih. Pada halaman tempat daftar film-film ditampilkan, dilakukan pengambilan data JSON seperti yang dijelaskan pada **3.**. Lalu, dibuat sebuah `ListView` yang akan menampilkan tiap film dengan cara mengiterasi data yang telah diambil dan diubah menjadi object-object `Movie`. Setelah itu, untuk menampilkan detail film, halaman untuk detail dipanggil dengan `Navigator` dan menerima parameter object `Movie` yang telah diiterasi tadi dimana field-field dari `Movie` tersebut akan ditampilkan pada halaman detail yang telah dibuat.

<br></br>
###### *Rayhan Putra Randi - 2106705644 - PBP A*