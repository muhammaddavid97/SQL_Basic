/*
	Tipe data string digunakan untuk menyimpan data dalam bentuk sekumpulan karakter
    Untuk menyimpan data dalam bentuk string harus dibungkus menggunakan tanda kutip single atau ganda
    Jika didalam string terdapat karakter khusus seperti tanda kutip atau lainnya maka wajib menggunakan
    karakter escape.
*/

SELECT 'Hello World' AS salam

SELECT 'David : "Halo apa kabar nama saya david"' AS sapa


/*
	Char dan Varchar adalah tipe data string yang sering digunakan untuk mendefinisika kolom pada table
    format penulisan 
    
    CHAR[M], VARCHAR[M]
    
    M => mengacu pada jumlah maksimal karakter yang diinput nantinya akan dialokasikan ke memori sql server
    Nilai maksimal M untuk char = 255 dan varchar = 65.535
    Jika nilai M tidak didefinisikan maka default M = 1
    
    Perbedaan char dan varchar tergantung bagaimana sql server mengalokasikan penyimpanan datanya
   	Misalkan jika kolom yang didefinisikan dengan char(5) menginput datanya sebanyak 1 maka sql server
    tetap akan menyimpan data tersebut di memory sebanyak 5 byte.
    Sebaliknya untuk kolom yang didefinisikan dengan kolom varchar(5) data yang diinput sebanyak 2 karakter
    maka data yang disimpan memori sesuai dengan jumlah inputannya. sehingga varchar lebih fleksibel
    
    Tipe data char cocok digunakan untuk data yang nilainya tetap seperti Nim, Nik dll
    Tipe data varchar cocok digunakan untuk data yang nilainya berubah 
*/

CREATE TABLE contoh_str_1(
id int primary key,
nama varchar(5),
nim char(5)
)


/*
	Tipe data text adalah tipe string yang memiliki jumlah alokasi data yang sangat besar
   
   Mekanisme untuk penyimpanan data memiliki sifat yang sama seperti varchar dimana tipe
    text akan menyimpan data sesuai dengan jumlah inputannya. 
*/

CREATE TABLE tipe_text_1 (
a tinytext,
b longtext,
c text
)


INSERT INTO tipe_text_1 VALUES 
('hello', 'bagaimana kabar anda', 'good morning')


/*
	Blob adalah tipe data text dimana data yang disimpan dalam bentuk format binary
    
    Tipe blob sering digunakan untuk menyimpan data multimedia seperti gambar atau video
*/

CREATE TABLE contoh_blob_1(
a int primary key,
b varchar(10) not null,
c blob
)


INSERT INTO contoh_blob_1 VALUES
(1, 'erna', 'siapa yang pantas')

