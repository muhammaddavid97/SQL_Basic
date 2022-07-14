/*
	SELECT DISTINCT berfungsi untuk menghapus data yang duplikat ketika ingin di tampilkan. format dasar sebagai berikut 
    
    SELECT DISTINCT nama_kolom FROM nama_table
*/

CREATE TABLE mahasiswa(
name varchar(30) not null,
asal varchar(25) not null,
kel char(1) not null,
tinggi tinyint not null,
jurusan varchar(20) not null,
nilai_uan decimal not null
)

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
('Bobby Permana', 'Medan', 'L',161, 'Ilmu Komputer', 280.82)

--menampilkan daftar seluruh kota asal mahasiswa dimana data yang sama hanya sekali ditampilkan
SELECT DISTINCT asal FROM mahasiswa ORDER BY asal DESC

-- menampilkan seluruh data jurusan pada table mahasiswa dimana data yang duplikat hanya ditampilkan sekali saja
SELECT DISTINCT jurusan FROM mahasiswa ORDER BY jurusan

/*

aggregate function, yakni function yang nilai inputan-nya butuh berbagai data (sekumpulan
data), dan mengembalikan satu nilai akhir.

• COUNT(): Menghitung jumlah baris data.
• MAX(): Menampilkan nilai tertinggi dari kumpulan data.
• MIN(): Menampilkan nilai terendah dari kumpulan data.
• AVG(): Menampilkan nilai rata-rata dari kumpulan data.
• SUM(): Menampilkan nilai total (penjumlahan) dari kumpulan data.
*/

-- berapa jumlah baris yang ada di dalam tabel
SELECT COUNT(*) FROM mahasiswa

-- menampilkan jumlah mahasiswa yang berasal dari jakarta
SELECT COUNT(name) FROM mahasiswa WHERE asal = 'Jakarta'

-- menampilkan jumlah mahasiswa perempuan dari seluruh table
SELECT COUNT(*) FROM mahasiswa WHERE kel =  'P'

-- SELECT * FROM mahasiswa

-- menampilkan  nilai_uan terkecil dan nilai_uan terbesar
SELECT MIN(nilai_uan), MAX(nilai_uan) FROM mahasiswa
