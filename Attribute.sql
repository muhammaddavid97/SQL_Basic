/*
	Null adalah atribut yang dapat didefinisikan didalam kolom 
    Kolom yang didefinisikan dengan atribut null datanya boleh tidak diisi
    kolom yang didefinisikan dengan atribut null dapat diisi dengan data bernilai null
*/

CREATE TABLE attr_null(
a int,
b varchar(30) null,
c date null
)

INSERT INTO attr_null VALUES
(11, 'david', now()),
(12, 'endang', now()),
(13, 'yusuf', now())

SELECT * FROM attr_null

/*
	Not null adalah atribut yang berfungsi untuk memastikan bahwa kolom harus berisi data tidak boleh null
    Jika kolom yang didefiniskan dengan attribut not null tidak berisi data maka akan menampilkan error
*/

CREATE TABLE attr_not_null(
a int not null,
b varchar(15) not null,
c date null
)

INSERT INTO attr_not_null VALUES
(12, 'ezra', '1999-02-21'),
(21, 'willian', '1987-05-13'),
(22, 'wiwid', '2001-07-21')

SELECT * FROM attr_not_null


/*
 On Update adalah attribut yang secara khusus digunakan untuk tipe data timestamp
 Current_timestamp => konstanta khusus yang mengembalikan waktu saat ini
 ON UPDATE Current_timestamp => atribut ini bertanggung jawab untuk mengupdate kolom dengan tipe timestamp ketika kolom lain pada baris sama
 nilainya di update.
 Jika kolom dengan tipe timestamp tidak ditulis kedua attribute diatas maka keduanya langsung aktif
 jika kolom dengan tipe timestamp mendefinisikan attribute current_timestamp saja maka attribute on update current_timestamp tidak aktif
 jika kolom dengan tipe timestamp mendefinisikan attribute on update current_timestamp saja maka nilai default yang digunakan 0
*/

CREATE TABLE contoh_timestamp_1 (
a tinyint,
b timestamp
)

INSERT INTO contoh_timestamp_1 (a) VALUES (1)
INSERT INTO contoh_timestamp_1 VALUES(12, null)


/*
   	Auto_increment adalah attribute khusus untuk tipe data numerik dimana kolom yang didefinisikan dengan attribute ini
    secara otomatis akan mengenerate angka naik secara otomatis.
   	Kolom yang didefinisikan dengan attribute auto_increment harus dipasangkan dengan primary key agar data
    yang dihasilkan unik
    kolom yang didefinisikan dengan attribute auto_increment secara otomatis akan mengenarate nilai walaupun
    kolom tersebut bernilai null, tidak diisi atau 0.
    Dalam sebuah table hanya boleh ada satu kolom yang didefinisikan dengan auto_increment.
    kolom yang didefinisikan dengan auto_increment secara otomatis akan bersifat not null
*/

CREATE TABLE contoh_ai_1(
a tinyint auto_increment primary key,
b varchar(30)
)

INSERT INTO contoh_ai_1 VALUES
('merah'),
(0, 'biru'),
(null, 'kuning')

SELECT * FROM contoh_ai_1

/*
  Primary key adalah attribute yang digunakan untuk mendefinisikan sebuah kolom menjadi primary key
  Primary key adalah kolom utama yang berfungsi sebagai identitas setiap baris
  Dalam sebuah table hanya boleh terdapat satu table
  Kolom yang didefinisikan dengan primary key tidak boleh null dan harus bersifat unik
*/

CREATE TABLE contoh_primary_key_1(
a int primary key,
b varchar(30)
)
