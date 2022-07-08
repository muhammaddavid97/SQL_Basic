-- perintah untuk membuat table baru pada database 
-- CREATE TABLE nama_table (nama_kolom tipe_kolom)
-- nama_table => nama table yang akan dibuat
-- nama_kolom => nama kolom pada table 
-- tipe_kolom => tipe data kolom pada table

CREATE TABLE provinsi (
	id_prov int,
	nama_prov varchar(100),
	ibu_kota varchar(100),
	populasi int,
	tgl_diresmikan DATE
)

-- perintah ini digunakan untuk melihat struktur pada table yang sudah dibuat
EXEC sp_columns provinsi

-- perintah untuk menghapus tabel 
-- DROP TABLE nama_table

DROP TABLE provinsi

-- perintah untuk menambahkan data ke dalam table, menggunakan printah ini wajib mengetahui jumlah kolom yang didefinisikan
-- dan urutan dari kolom tersebut 
-- INSERT INTO nama_table VALUES (data_kolom1, data_kolom2, dst..)

INSERT INTO provinsi
VALUES (1, 'jakarta', 'jakarta', 10012271, ' 1961-08-28')

-- perintah untuk menginput data lebih dari satu dengan memisahkan masing - masing data dengan koma
-- INSERT INTO nama_table VALUES (data_kolom1, data_kolom2), (data_kolom1, data_kolom2), dst...

INSERT INTO provinsi
VALUES
(2, 'banten', 'serang', 11704877, '2000-10-4'),
(3, 'kalimantan selatan', 'banjarmasin', 3922790, '1956-12-7')

-- perintah ini digunakan untuk menginput data berdasarkan kolom tertentu
-- dimana data harus diisi sesuai dengan kolom yang telah ditentukan 
-- INSERT INTO nama_table (kolom1_kolom2, dst..) VALUES (data1, data2, dst...)

INSERT INTO provinsi (nama_prov, ibu_kota, tgl_diresmikan, populasi, id_prov)
VALUES 
('kepulauan riau', 'tanjung pinang', '2002-10-25', 1917415, 4)

INSERT INTO provinsi (nama_prov, tgl_diresmikan, id_prov) 
VALUES 
('papua barat', '1999-02-12', 5)

SELECT * FROM provinsi

-- Perintah untuk mengubah data pada table 
-- UPDATE nama_table SET nama_kolom = data_baru WHERE kondisi
-- nama_table => nama table yang akan dirubah datanya
-- nama_kolom => nama kolom yang didalamnya terdapat data yang ingin diubah
-- data_baru => data baru yang akan dirubah nilainya
-- kondisi => kondisi terkait dengan membatasi data mana yang ingin diubah nilainya

UPDATE provinsi SET nama_prov = 'dki jakarta' WHERE id_prov = 1


-- perintah yang digunakan untuk menampilkan seluruh data pada table
-- SELECT * FROM nama_table 

-- perintah yang digunakan untuk menampilkan data berdasarkan kolom tertentu
-- SELECT nama_kolom1, nama_kolom2 FROM nama_table

SELECT nama_prov, ibu_kota FROM provinsi

-- perintah untuk menampilkan data berdasarkan kondisi tertentu
-- SELECT * FROM nama_table WHERE kondisi 

SELECT * FROM provinsi WHERE id_prov = 1 or nama_prov = 'banten'

-- perintah untuk menampilkan seluruh data berdasarkan urutan pada kolom tertentu
-- SELECT * FROM nama_table ORDER BY nama_kolom_urut [ASC /DESC]
-- ASC => data diurutkan dari kecil ke besar
-- DESC => data diurutkan dari besar ke kecil

SELECT * FROM provinsi ORDER BY nama_prov ASC;

SELECT nama_prov, ibu_kota FROM provinsi ORDER BY tgl_diresmikan DESC;

