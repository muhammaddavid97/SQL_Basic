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

