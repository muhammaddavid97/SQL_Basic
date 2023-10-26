-- Select adalah sebuah perintah sql yang digunakan untuk menampilkan sebuah data atau hasil
-- Perintah select dapat digunakan tanpa harus menyertakan nama table
-- menampilkan nama lengkap seseorang 
SELECT CONCAT('Muhammad', ' David')

-- menghitung proses aritmatika dasar
SELECT 10 + 4
SELECT 10 - 4
SELECT 10 * 4
SELECT 10 / 4

-- membuat table populasi 
CREATE TABLE Populasi(
	kota varchar(50) not null,
  	kec tinyint unsigned,
  	kel SMALLINT unsigned,
  	luas decimal(6,2),
  	penduduk int unsigned not null
)

INSERT INTO Populasi VALUES
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

-- untuk menampilkan data kolom tertentu dapat menggunakan query berikut 
SELECT kota, luas, penduduk FROM Populasi

-- menampilkan seluruh kolom pada table dengan menggunakan tanda wildcard "*" 
SELECT * FROM Populasi

-- SELECT nama_kolom AS nama_alias FROM nama_table 
-- query AS berfungsi untuk memberikan nama alias pada kolom dimana nantinya akan ditampilkan sebagai pengganti nama kolom saat ini 
SELECT kota AS 'Nama Kota', penduduk AS 'Kepadatan Warga' FROM Populasi

-- SELECT FROM nama_table ORDER BY nama_kolom [ASC | DESC]
-- query ORDER BY digunakan untuk menampilkan data berdasarkan urutan data tersebut 
-- ASC -> data diurutkan secara menaik
-- DESC -> data diurutkan secara menurun 

-- menampilkan data kota dan penduduk dimulai dari jumlah penduduk paling banyak sampai paling sedikit 
SELECT kota, penduduk FROM Populasi ORDER BY penduduk DESC 

-- menampilkan data kota dan penduduk dimulai dari jumlah penduduk paling sedikit sampai paling banyak 
SELECT kota, penduduk FROM Populasi ORDER BY penduduk ASC

-- menampilkan data kota dan penduduk berdasarkan urutan jumlah kecamatan dan kelurahan dari paling banyak sampai sedikit 
SELECT kota, penduduk, (kec + kel) AS jumlahKecdanKel FROM Populasi ORDER BY JumlahKecdanKel DESC



