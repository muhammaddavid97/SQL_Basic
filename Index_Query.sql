CREATE TABLE mahasiswa (
	nama VARCHAR(50),
	asal VARCHAR(50),
	kel ENUM('L','P'),
	tinggi TINYINT UNSIGNED,
	jurusan VARCHAR (20),
	nilai_uan DEC(5,2)
);

INSERT INTO mahasiswa VALUES
('Riana Putria', 'Padang', 'P', 155, 'Kimia', 339.20),
('Rudi Permana', 'Bandung', 'L', 163, 'Ilmu Komputer', 290.44),
('Sari Citra Lestari', 'Jakarta', 'P',161, 'Manajemen', 310.60),
('Rina Kumala Sari', 'Jakarta', 'P',158, 'Akuntansi', 337.99),
('James Situmorang', 'Medan', 'L',168, 'Kedokteran Gigi', 341.10),
('Sandri Fatmala', 'Bandung', 'P',165, 'Ilmu Komputer', 322.91),
('Husli Khairan', 'Jakarta','L',170, 'Akuntansi', 288.55),
('Christine Wijaya','Medan', 'P',157, 'Manajemen',321.74),
('Ikhsan Prayoga', 'Jakarta', 'L',172, 'Ilmu Komputer', 300.16),
('Bobby Permana', 'Medan', 'L',161, 'Ilmu Komputer', 280.82);

SELECT * FROM mahasiswa;

-- menampilkan data berdasarkan nama 'Sandri Fatmala
SELECT * FROM mahasiswa WHERE nama = 'Sandri Fatmala'

-- Index adalah query yang berfungsi untuk mencari sebuah data yang kompleks agar 
-- data dapat dicari dengan lebih cepat dan optimal. 

/*
  Membuat index dengan query satndar : 
  syntax sql : 
    CREATE [Jenis index] INDEX nama_index On nama_table (nama_kolom);
*/
'
CREATE INDEX nama ON mahasiswa(nama);

'-- memeriksa index
SHOW INDEX FROM mahasiswa;

/*
  Membuat index dengan query ALTER 
  syntax sql : 
    ALTER TABLE nama_table ADD INDEX (nama_kolom);
*/

ALTER TABLE mahasiswa ADD INDEX (asal);

-- memeriksa index 
SHOW INDEX FROM mahasiswa;



/*
  Menghapus index pada table
  syntax query : 
    DROP INDEX nama_index ON nama_table
*/

DROP INDEX nama ON mahasiswa;
DROP INDEX asal ON mahasiswa;

/*
  Index prefix adalah proses pembuatan index hanya untuk sebagian karakter awal saja misalnya untuk suatu karakter dengan ukuran varchar(200) 
  maka dengan hanya menampilkan 3 karakter awal kita bisa membuat suatu index yang lebih efisien daripada seluruh kolom dijadikan sebagai index
  
  syntax query : 
  CREATE INDEX nama_index ON nama_table (nama_kolom(jumlah_karakter));
*/

/*
  Query Explain adalah sebuah yang berfungsi untuk memeriksa apakah suatu table memanfaatkan index atau tidak
  
  syntax query : 
    EXPLAIN SELECT * FROM nama_Table WHERE nama_kolom = value;
*/

SELECT * FROM mahasiswa;

EXPLAIN SELECT * FROM mahasiswa WHERE nama = 'James Situmorang';

CREATE INDEX nama ON mahasiswa(nama);

EXPLAIN SELECT * FROM mahasiswa WHERE nama = 'James Situmorang';

-- menampilkan query explain untuk proses JOIN dua buah table 
EXPLAIN SELECT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM mahasiswa AS mhs 
JOIN universitas AS univ ON mhs.jurusan = univ.jurusan
WHERE nama_dekan = 'Maya Fitrianti, M.M';

-- menambahkan index ke dalam kolm jurusan di table mahasiswa
ALTER TABLE mahasiswa ADD INDEX (jurusan);

-- membuat index untuk kolom jurusan dan nama_dekan pada table universitas
ALTER TABLE universitas ADD INDEX (jurusan);
ALTER TABLE universitas ADD INDEX (nama_dekan);
