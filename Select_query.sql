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
	SELECT TOP digunakan untuk membatasi data yang ingin ditampilkan. format query 
    
    SELECT TOP number | percent column name 
    FROM nama_table
    ORDER BY | WHERE 
*/

SELECT TOP 5 * FROM populasi ORDER BY kel AS 'Kelurahan' DESC

/*
 OFFSETdan FETCHklausa adalah pilihan dari ORDER BYklausa. Mereka memungkinkan Anda untuk membatasi jumlah baris yang akan dikembalikan oleh kueri . berikut format penulisan query
 
 ORDER BY column_list [ASC |DESC]
OFFSET offset_row_count {ROW | ROWS}
FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY

- Klausa OFFSET menentukan jumlah baris yang akan dilewati sebelum mulai mengembalikan baris dari kueri. offset_row_countBisa berupa konstanta, variabel, atau parameter yang lebih besar atau sama dengan nol .
- Klausa FETCH menentukan jumlah baris yang akan dikembalikan setelah OFFSETklausa diproses. Can fetch_row_countadalah konstanta, variabel atau skalar yang lebih besar atau sama dengan satu.
-Klausa OFFSET bersifat wajib sedangkan FETCHklausa bersifat opsional. Juga, FIRSTdan NEXTadalah sinonim masing-masing sehingga Anda dapat menggunakannya secara bergantian. Demikian pula, Anda dapat menggunakan  FIRSTdan NEXTsecara bergantian.

klausa fetch dan offset sering digunakan untuk proses paggination pada data
 
*/

-- menampilkan 3 data pertama dan mengembalikan sisanya, gunakan klausa ofset

SELECT * FROM populasi ORDER BY kec OFFSET 3 ROWS

-- menampilkan 3 data pertama dan 2 data berikutnya diurutkan berdasarkan luas, gunakan kalusa offset dan fetch 

SELECT * FROM populasi ORDER BY luas OFFSET 3 FETCH NEXT 3 ROWS ONLY

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

