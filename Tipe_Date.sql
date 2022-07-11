/*
	Tipe date adalah tipe data yang digunakan untuk menyimpan data dalam format tanggal, waktu atau gabungan 
    keduanya.
    Jika sql server tidak dapat membaca inputan atau data tidak tersedia maka nilai date akan diisi sesuai 
    dengan kolom zero value.
    jika data date diinput dengan karakter tambahan seperti spasi atau tanda - maka wajib disimpan didalam
    tanda kutip
    Jika data date hanya berupa angka saja maka tidak perlu disimpan didalam tanda kutip
*/

CREATE TABLE contoh_date1(
a DATE,
b Time,
c DateTime,
d TimeStamp,
e Year
);

-- input data dengan tipe data date ke dalam table contoh_date1 dengan karakter tambahan
INSERT INTO contoh_date1 VALUES (
'2017-07-22',
'18:45:23',
'2017-07-22 18:45:23',
'2017-07-22 18:45:23',
'2017'
)

SELECT * FROM contoh_date1

-- input data dengan tipe data date ke dalam table contoh_date1 tanpa karakter tambahan hanya berupa angka
INSERT INTO contoh_date1 VALUES(
20170722,
184523,
20170722184523,
20170722184523,
2017
)

/*
	Now() => fungsi yang mengembalikan waktu saat ini dengan format tanggal dan waktu sekalgus
*/

INSERT INTO contoh_date1 VALUES(
NOW(),
NOW(),
NOW(),
NOW(),
NOW()
)
