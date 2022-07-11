/*
	ALTER TABLE perintah yang digunakan untuk mengubah struktur table baik itu menambah kolom baru,
    mengubah nama table, mengubah tipe data kolom dll
    
    format dasar bentuk dari query ALTER
    
    ALTER TABLE nama_table 
*/

-- sp_rename digunakan untuk mengubah nama table 

CREATE TABLE person(
nama varchar(30) not null,
age int not null
) 

sp_rename 'person', 'person2'


/*
	ALTER TABLE nama_table ALTER COLUMN column_name new_type_data(size) digunakan untuk mengubah tipe data 
    dan atribut kolom
*/

ALTER TABLE Person ALTER COLUMN address VARCHAR(15)

/*
  ALTER TABLE ADD COLUMN digunakan untuk menambahkan kolom baru ke dalam table format dasar bentuk query ini 
  
  ALTER TABLE name_table ADD nama_colum type_data attribute_column
*/

CREATE TABLE dosen (
nik char(10) not null,
name varchar(30) not null
) 

-- menambahkan kolom baru ke dalam table dosen
ALTER TABLE dosen ADD address varchar(30) Not Null

