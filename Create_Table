/*
  Create Table Like => Berfungsi untuk menyalin struktur table lain
  
  syntax query : 
    CREATE TABLE table_baru LIKE table_asal;
*/

CREATE TABLE contoh_table_asal (
	  a int not null PRIMARY key AUTO_INCREMENT,
  	b varchar(20) not null,
  	c date
);

DESC contoh_table_asal

INSERT INTO contoh_table_asal VALUES 
(1, 'merah', 20170101),
(null, 'hitam', 20170201),
(null, 'kuning', 20170301)

SELECT * FROM contoh_table_asal;

// copy table 

CREATE TABLE contoh_copy1 LIKE contoh_table_asal

DESC contoh_copy1


/*
  CREATE TABLE ... SELECT => Berfungsi mengcopy table beserta isi table. akan tetapi query ini tidak seluruh isi didalam kolom benar" semua tersalin
  hanya ada beberapa atribut, key dan index kolom yang benar" tercopy.
  
  syntax query :
    CREATE TABLE table_baru SELECT nama_kolom FROM table_asal;
*/

CREATE TABLE contoh_copy2 SELECT * FROM contoh_table_asal

DESC contoh_copy2

// menyalin beberapa kolom dari table yang sudah ada
CREATE TABLE contoh_copy3 SELECT a, c FROM contoh_table_asal

DESC contoh_copy3

