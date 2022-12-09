/*
  Store procedure adalah kode program bahasa SQL yang disimpan di dalam database
  
  Perbedaan antara procedure dan function
  1. procedure tidak mengembalikan nilai sedangkan fungsi mengembalikan nilai
  2. procedure harus dipanggil dengan perintah 'Call' sedangkan fungsi bisa dipanggil dengan perintah SELECT tau WHERE
  3. procedure memiliki input/output parameter sedangkan function hanya memiliki input parameter saja.
  
  syntax query SP : 
    CREATE ProcedureName(@parameter1, @parameter2, @parameter3...)
    BEGIN
    
    
    END
    
    CALL ProcedureName(nilai_argumen1, nilai_argumen2, nilai_argumen3...);
*/

CREATE TABLE nilai_mahasiswa
(
  nim char(8) PRIMARY KEY,
  nama varchar(30) not null,
  nilai_semester1 decimal(4,2),
  nilai_semester2 decimal(4,2),
  nilai_semester3 decimal(4,2)
);

INSERT INTO nilai_mahasiswa VALUES
('17090113', 'Riana Putria', 3.12, 2.98, 3.45),
('17140143', 'Rudi Permana', 2.56, 3.14, 3.22),
('17080305', 'Rina Kumala Sari', 3.45, 2.56, 3.67),
('17140119', 'Sandri Fatmala', 2.12, 2.78, 2.56),
('17090308', 'Christine Wijaya', 3.78, 3.23, 3.11);

SELECT * FROM nilai_mahasiswa;

-- mendefinisikan variable di maria db
SET @nama = 'david'
SELECT @nama

SET @x = 10;
SET @y = 2;

SET @hasil = @x + @y
SELECT @hasil

-- mendefinisikan store procedure dengan nama hello()
DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	SELECT 'Hello World';
END//

DELIMITER;

-- memanggil store procedure hello()
CALL hello();

-- menampilkan store procedure yang ada pada database 
SHOW PROCEDURE STATUS WHERE db = nama_database;

-- menampilkan detail query pada store procedure hello
SHOW CREATE PROCEDURE hello;

-- mendefinisikan store procedure untuk menampilkan data pada table nilai_mahasiswa
DELIMITER $$
CREATE PROCEDURE displayNilaiMahasiswa()
BEGIN 
	SELECT * FROM nilai_mahasiswa;
END$$

DELIMITER;

-- memanggil store procedure displayNilaiMahasiswa()
CALL displayNilaiMahasiswa();

-- menghapus store procedure
DROP PROCEDURE nama_procedure;

/*
  Membuat variable didalam store procedure berbeda dengan membuat variable biasa
  
  syntax query :
    DECLARE nama_variable tipe_data(size) [DEFAULT nilai_default]
*/

-- mendefenisikan variable didalam SP salam()
DELIMITER //

CREATE PROCEDURE salam()
BEGIN 
	-- mendefinisikan variable didalam SP 
    DECLARE sapa VARCHAR(30) DEFAULT 'Selamat pagi';
     
    -- mengubah nilai variable sapa
    SET sapa = 'Selamat siang';
    
    SELECT sapa;
END//

DELIMITER;

CALL salam();

-- membuat store procedure untuk menampilkan data mahasiswa dimana nilai ipk di semester2 lebih dari 3.00

DELIMITER //
CREATE PROCEDURE nilaiIPK ()
BEGIN 
	DECLARE minimumIPK double(4, 2) DEFAULT 0.00;
    
    SET minimumIPK = 3.00;
    
    SELECT nama. nilai_semester2 WHERE nilai_semester2 >= minimumIPK;
END//

DELIMITER;

CALL nilaiIPK();

/*
  Procedure dapat memiliki parameter lebih dari satu atau tidak sama sekali 
  
  syntax query :
    CREATE PROCEDURE nama_procedure([IN || OUT ||INOUT ] nama_parameter tipe_data(size))
    BEGIN
    END
*/

-- mendefinisikan store procedure dengan parameter 
DELIMITER //
CREATE PROCEDURE tampilMahasiswa(nama varchar(30))
BEGIN
	SELECT * FROM nilai_mahasiswa WHERE = nama;
END//

DELIMITER;

CALL tampilMahasiswa('Rudi Permana');

-- menampilkan data mahasiswa berdasarkan nama dengan perintah IF pada store procedure 

DELIMITER $$
CREATE PROCEDURE tampilMahasiswa(nama varchar(30))
BEGIN 
	IF nama = 'Rudi Permana'
    THEN 
    	SELECT * FROM nilai_mahasiswa;
    END IF;
END$$

DELIMITER;

CALL tampilMahasiswa('Rudi Permana');
CALL tampilMahasiswa('Sandri Fatmala');
CALL tampilMahasiswa('Rina Kumala Sari');
