-- SELECT nama_kolom1, nama_kolom2 FROM nama_table1 
-- UNION
-- SELECT nama_kolom1, nama_kolom2 FROM nama_table2 

-- query ini berfungsi untuk menampilkan data dari dua atau lebih query select 
-- syarat untuk melakukan query ini adalah jumlah kolom yang ditampilkan haru sama 
-- data yang ditampilkan akan diurutkan dari table pertama sampai terakhir data table kedua

SELECT ibukota FROM daftar_provinsi WHERE ibukota LIKE 'b%'
UNION 
SELECT kota FROM Populasi 

-- Aggregate function adalah sebuah fungsi bawaan RDBMS dimana fungsi ini digunakan untuk inputan sekumpulan data dan mengembalikan data akhir
-- macam - macam aggregate function 
-- COUNT() => menghitung jumlah baris data
-- MAX() => menampilkan nilai tertinggi dari sekumpulan data
-- MIN() => menampilkan nilai terendah dari sekumpulan data
-- AVG() => menampilkan nilai rata-rata dari sekumpulan data
-- SUM() => menampilkan total penjumlahan dari sekumpulan data

-- menampilkan jumlah baris yang ada didalam table 
SELECT COUNT(*) FROM mahasiswa

--  berapa jumlah mahasiswa yang berasal dari Jakarta
SELECT COUNT(asal) FROM mahasiswa WHERE asal = 'Jakarta'

-- jumlah mahasiswa perempuan yang ada di dalam tabel mahasiswa
SELECT COUNT(*) FROM mahasiswa WHERE kel = 'P'

-- berapa nilai tertinggi dan terendah dari seluruh nilai uan
SELECT MIN(nilai_uan) as 'Nilai terendah', MAX(nilai_uan) AS 'Nilai tertinggi' FROM mahasiswa

-- mencari rata-rata nilai uan serta total jumlah nilai uan 
SELECT AVG(nilai_uan) AS 'Nilai rata-rata', SUM(nilai_uan) AS 'Nilai total' FROM mahasiswa

-- mengetahui siapa nama mahasiswa yang memiliki nilai uan tertinggi
SELECT nama FROM mahasiswa WHERE nilai_uan = (SELECT MAX(nilai_uan) FROM mahasiswa)

-- menampilkan daftar mahasiswa yang memiliki nilai uan di atas rata-rata seluruh mahasiswa
SELECT nama FROM mahasiswa WHERE nilai_uan >= (SELECT AVG(nilai_uan) FROM mahasiswa)

-- berapa jumlah jurusan yang telah dipilih oleh mahasiswa
SELECT COUNT(DISTINCT jurusan) FROM mahasiswa


-- SELECT nama_kolom FROM nama_table WHERE kondisi GROUP BY nama_kolom 
-- query ini digunakan untuk mengelompokan data berdasarkan kriteria tertentu pada suatu table 
-- umumnya query ini digunakan bersama aggregate function 
-- syarat penggunaan query group by adalah apabila didalam table terdapat data berulang 
-- HAVING adalah query yang digunakan sebagai pengganti query where pada group by 

-- Berapa jumlah mahasiswa yang berasal dari setiap kota
SELECT asal, COUNT(asal) AS jumlah_kota FROM mahasiswa GROUP BY asal ORDER BY jumlah_kota

-- Tampilkan nama jurusan terbanyak yang dipilih mahasiswa
SELECT jurusan, COUNT(jurusan) AS Jumlah FROM mahasiswa GROUP BY jurusan ORDER BY Jumlah DESC LIMIT 1

-- menampilkan nama jurusan yang dipilih oleh setidaknya 2 atau lebih mahasiswa
SELECT jurusan, COUNT(jurusan) AS Jumlah FROM mahasiswa GROUP BY jurusan HAVING Jumlah > 1

-- berapa tinggi badan minimum, maksimum dan ratarata dari semua mahasiswa yang berasal dari Jakarta
SELECT asal, MAX(tinggi) AS Maksimum, MIN(tinggi) AS Minimum, AVG(tinggi) Average
FROM mahasiswa WHERE asal = 'Jakarta'

-- berapa tinggi badan minimum, maksimum dan ratarata dari semua mahasiswa pada setiap kota 
SELECT asal, MAX(tinggi) AS Maksimum, MIN(tinggi) AS Minimum, AVG(tinggi) Average
FROM mahasiswa GROUP BY asal ORDER BY Maksimum DESC

-- Tampilkan data nilai uan minimum, nilai uan maksimum, serta nilai uan rata-rata untuk setiap jurusan yang dipilih mahasiswa
SELECT jurusan, MAX(nilai_uan) AS Maksimum, MIN(nilai_uan) AS Minimum, AVG(nilai_uan) Average
FROM mahasiswa GROUP BY jurusan ORDER BY Maksimum DESC

