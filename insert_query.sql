/*
 INSERT [INTO] nama_table SET nama_kolom1 = nilai1, nama_kolom2 = nilai2, dst.. 
 nama_table => nama table yang akan diisi datanya
 nama_kolom1 => nama kolom pertama yang akan diinput data
 nilai_1 => data pertama pada kolom pertama 
 nama_kolom2 => nama kolom kedua yang akan diinput data
 nilai_2 => data kedua pada kolom kedua.
 
 Menggunakan query ini tidak harus berurut sesuai kolom untuk melakukan insert data.
 Menggunakan query ini harus sesuai dengan nilai yang ingin diinput.
*/

CREATE TABLE contoh_insert_set (
a int primary key,
b varchar(30),
c timestamp null
)

INSERT INTO contoh_insert_set SET b = 'daid', a = 1, c = null;

/*
 INSERT SELECT digunakan untuk mengisi data ke dalam table dimana nilai nya berasal dari table lain
 
*/

CREATE TABLE person (
nik char(10) primary key,
name varchar(30) not null,
age int not null,
address varchar(15) null
)

INSERT INTO person VALUES
('14515212', 'yunus', 21, 'cirebon'),
('14515213', 'eka', 23, 'bogor'),
('14515214', 'joko', 34, null)


CREATE TABLE panitia (
nik char(10) primary key,
name varchar(30) not null,
age int not null,
address varchar(20) null
)

/*
 menggunakan insert select untuk mengambil dari data dari table person ke tab;e panitia
*/
INSERT INTO panitia SELECT * FROM person

SELECT * FROM panitia;

INSERT INTO panitia (age, name, nik) SELECT age, name, nik FROM person

CREATE TABLE dosen(
nid char(10) primary key,
name varchar(40) not null,
age tinyint not null,
alamat varchar(30) null
) 

/*
 ON DUPPLICATE KEY UPDATE digunakan untuk mencegah terjadinya error jika terdapat data yang duplikat ketika 
 melakukan insert data.
*/

CREATE TABLE contoh_insert_6(
a int primary key,
b varchar(30) not null
)

INSERT INTO contoh_insert_6 VALUES
(1, 'merah'),
(2, 'hijau'),
(3, 'kuning')

-- error karena kolom a didefinisikan sebagai primary key
INSERT INTO contoh_insert_6 VALUES(2, 'jingga')


-- menggunakan ON DUPPLICATE KEY UPDATE agar data kolom b pada baris yang ditentukan bernilai jingga
INSERT INTO contoh_insert_6 VALUES (2, 'jingga') ON DUPLICATE KEY UPDATE b = 'jingga'
