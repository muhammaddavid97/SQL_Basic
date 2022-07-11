/*
	Tipe data enum adalah tipe data yang berisi nilai yang sudah kita tentukan sendiri 
  Tipe enum hanya dapat memilih satu nilai dimana datanya sudah kita tentukan.
*/

CREATE TABLE contoh_enum1(
jurusan ENUM("teknik informatika", "tekniks sipil", "teknik elektro", "teknik industri")
)

INSERT INTO contoh_enum1 VALUES('teknik infoematika')
INSERT INTO contoh_enum1 VALUES('teknik elektro')

-- selain menggunakan tipe string enum dapat dinput dengan angka
INSERT INTO contoh_enum1 VALUES(1)
INSERT INTO contoh_enum2 VALUES(3)

-- menampilkan data jurusan dengan kondisi tertentu 
SELECT * FROM contoh_enum1 WHERE jurusan = 3

