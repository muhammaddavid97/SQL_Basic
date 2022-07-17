/*
	SELECT GROUP BY berfungsi untuk mengelompokan data berdasarkan kriteria tertentu. query ini hanya bisa dipakai
    jika didalam table terdapat data duplikat yang bisa kita kelompokan. format sebagai berikut 
    
    SELECT nama_kolom FROM nama_table WHERE kondisi GROUP BY nama_kolom
*/

-- Berapa jumlah mahasiswa yang berasal dari setiap kota
SELECT asal, COUNT(asal) AS jumlah_kota FROM mahasiswa GROUP BY asal ORDER BY jumlah_kota DESC

-- Tampilkan nama jurusan terbanyak yang dipilih mahasiswa

SELECT TOP 1 jurusan, COUNT(jurusan) AS jumlah_jurusan
FROM
mahasiswa
GROUP By
jurusan
ORDER BY 
jumlah_jurusan DESC

-- HAVING berfungsi sebagai perintah untuk memberi suatu kondisi khusus untuk query GROUP BY 
SELECT jurusan, COUNT(jurusan) AS jumlah_jurusan
FROM 
mahasiswa
GROUP BY 
jurusan
HAVING jumlah_jurusan > 1

-- Tampilkan data nilai uan minimum, nilai uan maksimum, serta nilai uan rata-rata untuk setiap jurusan yang dipilih mahasiswa
SELECT jurusan, nilai_uan, MAX(nilai_uan), MIN(nilai_uan), AVG(nilai_uan)
FROM 
mahasiswa
GROUP BY 
jurusan



CREATE TABLE universitas(
jurusan varchar(25) not null,
tgl_beridiri date not null,
nama_dekan varchar(50) not null,
jumlah_mhs int not null,
akreditas char(1) null
)

INSERT INTO universitas VALUES
('Kimia', '1987-07-12', 'Prof. Mulyono, M.Sc.', 662, 'B'),
('Ilmu Komputer', '2003-02-23', 'Dr. Syahrial, M.Kom.', 412, 'A'),
('Akuntansi', '1985-03-19', 'Maya Fitrianti, M.M.', 895, 'B'),
('Farmasi', '1997-05-30', 'Prof. Silvia Nst, M.Farm.', 312, 'C'),
('Fisika', '1989-12-10', 'Dr. Umar Agustinus, M.Sc.', 275, 'A'),
('Hukum', '1983-08-08', 'Prof. Gunarto, M.H.', 754, 'B');

/*
   SELECT JOIN query yang berfungsi untuk menggabungkan beberapa table dengan syarat nilainya harus ada yang sama antar table yang ingin digabung.
   terdapat 3 jenis dari query JOIN :
    - INNER JOIN => mengambil nilai dari kolom yang menjadi kunci di kedua table kemudian tampilkan nilai yang sama saja.
    - RIGHT JOIN => mengambil nilai dari kolom yang menjadi kunci di kedua table kemudian tampilkan seluruh kolom sebelah kanan 
    - LEFT JOIN =>  mengambil nilai dari kolom yang menjadi kunci di kedua table kemudian tampilkan seluruh kolom sebelah kiri
    
    format query :
    SELECT nama_kolom FROM nama_table1 JOIN nama_tabl2 ON table1.kolom1 = table2.kolom2
*/

-- menampilkan kolom nama dan jurusan dari tabel mahasiswa, serta kolom dekan dari tabel universitas.

-- Cara pertama penggabungan table menggunakan query WHERE
SELECT mhs.name, mhs.jurusan, univ.nama_dekan
FROM 
mahasiswa AS mhs, 
universitas AS univ
WHERE mhs.jurusan = univ.jurusan
ORDER by mhs.name DESC

-- cara kedua penggabungan table menggunakan query INNER JOIN
SELECT mhs.name, mhs.jurusan, univ.nama_dekan
FROM 
mahasiswa AS mhs
INNER JOIN
universitas AS univ
ON mhs.jurusan = univ.jurusan

-- menggunakan RIGHT JOIN untuk penggabungan table
SELECT mhs.name AS 'Nama mahasiswa', mhs.jurusan AS 'Jurusan', univ.nama_dekan 'Dekan fakultas'
FROM 
mahasiswa AS mhs
RIGHT JOIN
universitas AS univ
ON mhs.jurusan = univ.jurusan
ORDER BY univ.nama_dekan ASC

-- menggunakan query LEFT JOIN untuk menampilkan seluruh data pada table sebelah kiri
SELECT mhs.name, mhs.jurusan, univ.nama_dekan
FROM 
mahasiswa AS mhs
LEFT JOIN
universitas 
AS univ
ON mhs.jurusan = univ.jurusan
ORDER BY univ.nama_dekan DESC

-- menampilkan seluruh data hasil dari LEFT JOIN dimana data yang ditampilkan yang nama_dekan adalah null
SELECT mhs.name, mhs.jurusan, univ.nama_dekan
FROM 
mahasiswa AS mhs
LEFT JOIN
universitas AS univ
ON mhs.jurusan = univ.jurusan
WHERE univ.nama_dekan is NULL


SELECT prov.prov, prov.ibukota, pop.kel, pop.kec
FROM 
daftar_provinsi AS prov
LEFT JOIN
Populasi AS pop
ON prov.ibukota = pop.kota
ORDER BY pop.kel AND pop.kec
