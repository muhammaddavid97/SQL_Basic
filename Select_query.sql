/*
	Select => perintah yang digunakan untuk menampilkan data pada table 
*/

SELECT 'Hello World' as pesan

-- mendefinisikan table populasi 

CREATE TABLE populasi(
kota varchar(30) not null,
kec int not null,
kel int not null,
luas double not null,
penduduk int not null
)

INSERT INTO populasi VALUES
('Jakarta', 44, 267, 664.01, 9988495),
('Surabaya', 31, 154, 350.54, 2805906),
('Medan', 21, 151, 265.00, 2465469),
('Bekasi', 12, 56, 206.61, 2381053),
('Bandung', 30, 151, 167.67, 2339463),
('Makassar', 14, 143, 199.26, 1651146),
('Depok', 11, 63, 200.29, 1631951),
('Semarang', 16, 177, 373.78, 1621384),
('Tangerang', 13, 104, 153.93, 1566190),
('Palembang', 14, 107, 369.22, 1548064)

-- perintah ini digunakan untuk menampilkan seluruh kolom pada table populasi
SELECT * FROM populasi

-- menampilkan data pada kolom tertentu 

SELECT kel, kec, luas FROM populasi

/*
	SELECT AS adalah query yang digunakan untuk memberi nama alias pada kolom
*/

SELECT kel AS kelurahan FROM populasi
SELECT kota, kec AS kecamatan, kel AS kelurahan FROM populasi

-- menampilkan data kota kemudian ubah menjadi huruf besar dan kemudian hitung total kecamatan dan kelurahan
SELECT UPPER(kota) AS 'Kota', kec + kel AS 'Total kecamatan dan kelurahan' FROM populasi

/*
	SELECT ORDER BY berfungsi untuk menampilkan data kemudian diurutkan berdasarkan kolom tertentu. format sebagai berikut
    
    SELECT * FROM nama_table ORDER BY nama_kolom_diurutkan [ASC | DESC]
    
    ASC => perintah yang berfungsi untuk mengurutkan data dari paling kecil ke paling besar, perintah ini sebagai default 
    DESC => perintah yang berfungsi untuk mengurutkan data dari paling besar ke paling kecil
*/

SELECT * FROM populasi ORDER BY kel DESC;
-- menampilkan data kota dan penduduk berdasarkan urutan pada kolom luas secara desceding
SELECT kota AS 'Nama kota', penduduk AS 'Total penduduk' FROM populasi ORDER BY luas DESC;

-- menampilkan data mulai dari populasi yang paling sedikit hingga yang paling besar
SELECT * FROM populasi ORDER BY penduduk ASC

-- tampilan diatas diurutkan mulai dari kota yang punya kecamatan paling banyak hingga paling kecil
SELECT kota FROM populasi ORDER BY kec DESC


/*
  SELECT LIMIT digunakan untuk membatasi jumlah data yang akan ditampilkan biasanya query ini dipakai 
  bersama ORDER BY untuk menampilkan sedikit data yang sudah diurutkan berdasarkan kolom tertentu
  
  syntax query :
  	SELECT * FROM nama_table ORDER BY nama_kolom LIMIT jumlah_data
	
  Jika perintah limit terdiri dari 2 angka maka angka pertama menyatakan jumlah baris yang dilewati
  sedangkan angka kedua menyatakan jumlah baris yang ditampilkan
*/

-- menampilkan 5 provinsi dengan jumlah kelurahan tertinggi dari tabel populasi
SELECT * FROM populasi ORDER BY kel DESC LIMIT 5

-- menampilkan tabel populasi untuk posisi ke 6, 7 dan 8 berdasarkan jumlah kelurahan
SELECT * FROM populasi ORDER BY kel LIMIT 5, 3

-- menampilkan provinsi urutan 5 dan 6 jika dihitung berdasarkan luas wilayah
SELECT * FROM provinsi ORDER BY wilayah ASC LIMIT 4, 2

/*
   SELECT WHERE adalah perintah yang digunakan untuk melakukan filterisasi atau membatasi data yang ditampilkan
    berdasarkan kondisi tertentu. format query sebagai berikut
    
    SELECT nama_kolom FROM nama_table WHERE kondisi1 [AND | OR] kondisi2
*/

-- menampilkan data pada kolom kota dan kelurahan dimana luasnya adalah 265
SELECT kota, kel AS 'kelurahan' FROM populasi WHERE luas = 265

-- menampilkan seluruh data pada table populasi yang memiliki jumlah kecamatan lebih dari 20
SELECT * FROM populasi WHERE kec > 20

-- menampilkan data table populasi-- Tampilkan kota dengan jumlah kecamatan lebih dari 20 atau luas kota kurang dari 300
SELECT kota FROM populasi WHERE kec > 20 OR luas < 300 yang memiliki kota tanpa selain jakarta dan bandung
SELECT * from populasi WHERE kota != 'Jakarta' AND kota != 'Bandung'

-- menampilkan data populasi dimana nama kotanya jakarta atau jumlah kel kurang dari 100 
SELECT * FROM populasi WHERE kota = 'Jakarta' OR kel < 100

-- Tampilkan kota dengan jumlah kecamatan lebih dari 20 dengan luas kota kurang dari 300 km2
SELECT kota FROM populasi WHERE kec > 20 AND luas < 300

-- Tampilkan kota dengan jumlah penduduk antara 1.000.000 hingga 2.000.000.
SELECT kota FROM populasi WHERE penduduk >= 1000000 AND penduduk >= 2000000

/*
Tampilkan kota dengan jumlah kecamatan lebih besar dari 20, atau memiliki luas kurang dari
300 km2, dimana setiap kota itu harus memiliki jumlah penduduk kurang dari 2.000.000
*/
SELECT kota FROM populasi WHERE (kec > 20 OR luas < 300) AND penduduk < 2000000

