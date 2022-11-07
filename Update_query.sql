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

