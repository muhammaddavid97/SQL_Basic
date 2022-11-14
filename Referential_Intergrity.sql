/*
  Primary key adalah sebuah atribute dimana kolom yang dijadikan sebagai primary key data nya harus unik artinya
  tidak boleh ada data yang duplikat.
  
  Foreign key adalah menunjuk ke kolom dari suatu table dimana nilainya merujuk ke primary key dari table lain.
  
  Referential Integrity adalah istilah untuk memberi batasan dimana kolom yang didefinisikan sebagai foreign key(child table)
  datanya harus merujuk ke table yang dijadikan sebagai primary key(parent table)
  
  syntax query referential integrity : 
    CREATE TABLE nama_table 
    (
      deklarasi kolom1,
      deklarasi kolom2,
      ...
      [Constraint]
      FOREIGN KEY(nama_kolom_child) REFERENCE parent_table(nama_kolom_parent)
      [ON DELETE reference_option]
      [ON DELETE reference_option]
    )
*/

-- table universitas dijadikan sebagai parent table
CREATE TABLE universitas(
	jurusan VARCHAR(20) PRIMARY KEY,
  	tgl_berdiri DATE NOT NULL,
  	nama_dekan VARCHAR(50)
)ENGINE = INNODB;

INSERT INTO universitas VALUES
('Kimia', '1987-07-12', 'Prof. Mulyono, M.Sc.'),
('Ilmu Komputer', '2003-02-23', 'Dr. Syahrial, M.Kom.'),
('Akuntansi', '1985-03-19', 'Maya Fitrianti, M.M.'),
('Farmasi', '1997-05-30', 'Prof. Silvia Nst, M.Farm.');

-- table mahasiswa dijadikan sebagai table foreign key
CREATE TABLE mahasiswa(
	nim CHAR(8) PRIMARY KEY,
  	nama VARCHAR(30) NOT NULL,
  	asal VARCHAR(30) NOT NULL,
  	jurusan VARCHAR(20) NOT NULL,
  	FOREIGN KEY(jurusan) REFERENCES universitas(jurusan)
)ENGINE = INNODB;

-- Insert data ke dalam table universitas dimana nilai kolom jurusan di table mahasiswa harus tersedia di table universitas
INSERT INTO mahasiswa VALUES ('14515723', 'Turini', 'Jamblang', 'Kimia');


-- menampilkan error karena nilai jurusan mahasiswa tidak tersedia di jurusan universitas
INSERT INTO mahasiswa VALUES ('14515724', 'Kuriniawan', 'Susukan', 'Fisika');

INSERT INTO universitas VALUES ('Fisika', '2012-05-21', 'Supriyono');

SELECT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM universitas AS univ 
JOIN mahasiswa AS mhs ON univ.jurusan = mhs.jurusan;

-- Proses update akan menyebabkan error jika value jurusan di table mahasiswa tidak tersedia di table jurusan universitas
UPDATE mahasiswa SET jurusan = 'Hukum' WHERE jurusan = 'Fisika';

/*
  ON UPDATE dan ON DELETE sebuah perintah yang berfungsi untuk menentukan apakah proses referential integrity dapat mengizinkan prose 
  update atau delete diantara dua table.
  
  CASCADE adalah perintah yang akan memberikan efek turunan pada table child nya jika terjadi proses delete atau update di table parent nya
*/

CREATE TABLE mahasiswa(
	nim CHAR(8) PRIMARY KEY,
  	nama VARCHAR(30) NOT NULL,
  	asal VARCHAR(30) NOT NULL,
  	jurusan VARCHAR(20) NOT NULL,
  	FOREIGN KEY(jurusan) REFERENCES universitas(jurusan)
    ON UPDATE CASCADE
  	ON DELETE CASCADE
)ENGINE = INNODB;


INSERT INTO mahasiswa VALUES
('17140143', 'Rudi Permana', 'Bandung', 'Ilmu Komputer'),
('17080305', 'Rina Kumala Sari', 'Jakarta', 'Akuntansi'),
('17140119', 'Sandri Fatmala', 'Bandung', 'Ilmu Komputer'),
('17080225', 'Husli Khairan', 'Jakarta', 'Akuntansi'),
('17140133', 'Ikhsan Prayoga', 'Jakarta', 'Fisika');

-- melakukan proses update untuk kolom jurusan di table universitas karena di table child menerapkan ON UPDATE CASCADE
-- maka ketika terjadi proses update di table parent akan mempengaruhi value di kolom table child yang bersangkutan.
UPDATE universitas SET jurusan = 'Teknik Informatika' WHERE jurusan = 'Ilmu Komputer';

SELECT * FROM mahasiswa;

