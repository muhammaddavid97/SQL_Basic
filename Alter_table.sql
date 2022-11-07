/*
   ALTER TABLE => Berfungsi untuk mengubah struktur table baik itu mengganti nama table, nama kolom, tipe data kolom, menambahkan kolom baru
   menghapus kolom yang sudah ada hingga mengganti storage engine dari sebuah table.
   
   syntax berikut : 
   	ALTER TABLE nama_table [alter_specification [, alter_specification] ...]
*/

/*
   ALTER TABLE ... RENAME => berfungsi untuk mengubah nama table
   
   syntax berikut : 
   	ALTER TABLE nama_table_lama RENAME [TO | AS] nama_table_baru
*/

CREATE TABLE contoh_alter1(
	a int AUTO_INCREMENT PRIMARY KEY,
    b VARCHAR(20) NOT NULL
);

ALTER TABLE contoh_alter1 RENAME TO contoh_alter01;

DESC contoh_alter01

/*
	ALTER TABLE MODIFY => Berfungsi untuk mengubah tipe data dan atribut dari sebuah kolom
    
    syntax berikut : 
    	ALTER TABLE nama_table MODIFY nama_kolom tipe_data_kolom [attribut_kolom];
*/

ALTER TABLE contoh_alter01 MODIFY a tinyint AUTO_INCREMENT;

DESC contoh_alter01;

/*
  ALTER TABLE CHANGE => berfungsi untuk mengubah nama kolom sekaligus tipe datanya
  
  syntax berikut : 
  	ALTER TABLE nama_table CHANGE nama_kolom nama_kolom_baru tipe_kolom [attribut_kolom];
*/

ALTER TABLE contoh_copy1 CHANGE c d timestamp;

DESC contoh_copy1;
