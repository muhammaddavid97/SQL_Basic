CREATE TABLE mahasiswa_baru (
	nim char(15) not null PRIMARY KEY,
  	nama varchar(30) not null,
  	asal varchar(20) not null,
  	jurusan varchar(25) not null,
  	nilai_uan decimal(5,2) not null
);

INSERT INTO mahasiswa_baru VALUES
('17090113', 'Riana Putria', 'Padang', 'Kimia', 339.20),
('17140143', 'Rudi Permana', 'Bandung', 'Ilmu Komputer', 290.44),
('17090222', 'Sari Citra Lestari', 'Jakarta', 'Manajemen', 310.60),
('17080305', 'Rina Kumala Sari', 'Jakarta', 'Akuntansi', 337.99),
('17020217', 'James Situmorang', 'Medan', 'Kedokteran Gigi', 341.10),
('17140119', 'Sandri Fatmala', 'Bandung', 'Ilmu Komputer', 322.91),
('17080225', 'Husli Khairan', 'Jakarta', 'Akuntansi', 288.55),
('17090308', 'Christine Wijaya','Medan','Manajemen',321.74),
('17140133', 'Ikhsan Prayoga', 'Jakarta', 'Ilmu Komputer', 300.16),
('17140120', 'Bobby Permana', 'Medan', 'Ilmu Komputer', 280.82);

SELECT * FROM mahasiswa_baru;


/*
  UPDATE => Berfungsi untuk mengupdate atau memperbarui data pada table.
  
  syntac berikut : 
    UPDATE nama_table SET kolom_1 = nilai1, kolom2 = nilai2 WHERE kondisi;
*/

-- memperbarui nilai nama berdasarkan nim dengan nilai '17090113'
UPDATE mahasiswa_baru SET nama = 'Si Bangsat' WHERE nim = '17090113'

-- mengubah atau mengupdate sebanyak 3 kolom berdasarkan kolom nim '17090113'
UPDATE mahasiswa_baru 
set 
nama = 'James Bond', 
asal = 'New York',
jurusan = 'Teknik Industri'
WHERE 
nim = '17090113'


SELECT * FROM mahasiswa_baru WHERE jurusan = 'Ilmu Komputer' ORDER BY nama DESC LIMIT 2;
-- Lakukan proses update terhadapa kolom jurusan berdasarkan query diatas 
UPDATE mahasiswa_baru SET jurusan = 'Teknik Informatika' WHERE jurusan = 'Ilmu Komputer' ORDER BY nama DESC LIMIT 2;

SELECT * FROM mahasiswa_baru;

--mengubah nilai_uan menjadi 100 untuk mahasiswa yang memiliki nilai_uan kurang dari 300. Berikut querynya
UPDATE mahasiswa_baru SET nilai_uan = 100 WHERE nilai_uan < 300;

-- Membuat table universitas
CREATE TABLE universitas (
	jurusan varchar(20) Not null,
  	tgl_berdiri timestamp not null,
  	nama_dekan varchar(30) not null,
  	jumlah_mahasiswa int not null,
  	akr char(1) not null
);

INSERT INTO universitas VALUES 
('kimia', '1987-07-12', 'Prof. Mulyono, M.Sc', 662, 'B'),
('Ilmu Komputer', '2003-02-23', 'Dr. Syahrial, M.Kom', 412, 'A'),
('Akuntansi', '1985-03-19', 'Maya Fitrianti, M.M', 895, 'B'),
('Farmasi', '1997-05-30', ' Prof. Silvia Nst, M.Farm', 312, 'C'),
('Fisika', '1989-12-10', 'Dr. Umar Agustinus, M.Sc.', 275, 'A'),
('Hukum', '1983-08-08', 'Prof. Gunarto, M.H', 754, 'B');

-- Ubah kota asal di tabel mahasiswa_baru menjadi Pekanbaru untuk mahasiswa yang memilih jurusan dengan nama dekan Prof. Mulyono, M.Sc.
UPDATE mahasiswa_baru AS mhs JOIN universitas AS univ 
SET asal = 'Pekanbaru'
WHERE mhs.jurusan = univ.jurusan 
AND univ.nama_dekan = 'Prof. Mulyono, M.Sc';
