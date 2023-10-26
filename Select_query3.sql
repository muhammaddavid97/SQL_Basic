-- SELECT nama_kolom FROM nama_table WHERE nama_kolom IN (nilai_kolom) 
-- SELECT nama_kolom FROM nama_table WHERE nama_kolom NOT IN (nilai_kolom) 
-- query ini berfungsi untuk menampilkan data berdasarkan kondisi nilai himpunan 
-- IN => operator yang berfungsi untuk menampilkan data berdasarkan himpunannya 
-- NOT IN => kebalikan dari operator IN 

-- menampilkan tabel populasi dimana kolom kota ada di dalam himpunan Jakarta, Bandung dan Medan:
SELECT * FROM Populasi WHERE kota IN ('Bandung', 'Jakarta', 'Medan')

-- menampilkan tabel populasi dimana kolom kota selain yang ada di dalam himpunan Jakarta, Bandung dan Medan
SELECT * FROM Populasi WHERE kota NOT IN ('Jakarta', 'Bandung', 'Medan')

-- menampilkan table populasi dimana kolom kota merupakan ibukota provinsi 
SELECT * FROM Populasi WHERE kota IN (SELECT ibukota FROM daftar_provinsi)

-- SELECT nama_kolom FROM nama_table WHERE nama_kolom =  [ANY() | SOME() | ALL()]
-- query ini memiliki fungsi yang sama seperti query IN tetapi sedikit lebih kompleks 
-- query ini biasanya dipakai pada saat menggunakan subquery (query bersarang)
-- ketiga query ini dapat menggunakan berbagai macam operator perbandingan 

-- Tampilkan seluruh data yang ada di tabel populasi, dimana nama kotanya sama dengan salah satu himpunan nama ibukota yang ada di dalam tabel daftar_provinsi
SELECT * FROM Populasi WHERE kota = ANY(SELECT ibukota FROM daftar_provinsi)

-- SELECT EXISTS (subquery)
-- SELECT nama_kolom FROM nama_table WHERE EXITST(subquery)
-- query ini digunakan untuk memeriksa apakah subquery ada atau tidak hasilnya true jika terdapat minimal satu baris atau
-- false jika tidak ditemukan baris sama sekali. nilai  true akan dikonversi menjadi 1 dan false akan dikonversi menjadi 0
-- untuk membalikan logika EXIST kita bisa menggunakan query NOT EXISTS 

SELECT EXISTS (SELECT kota FROM Populasi WHERE kota = 'Bandung') -- true 
SELECT EXISTS (SELECT kota FROM Populasi WHERE kota = 'Kupang') -- false 

-- menampilkan seluruh baris pada table Populasi berdasarkan kondisi perintah EXISTS 
SELECT * FROM Populasi WHERE EXISTS(SELECT ibukota FROM daftar_provinsi WHERE ibukota = 'Bandung')

-- SELECT nama_kolom FROM nama_table WHERE nama_kolom BETWEEN nilai_kolom1 AND nilai_kolom2 
-- query ini digunakan untuk menampilkan data berdasarkan kondisi dengan range tertentu 
-- NOT BETWEEN query ini digunakan untuk membalikan logika BETWEEN 

-- menampilkan isi tabel populasi dimana nilai kolom kecamatan antara 20 dan 30
SELECT * FROM Populasi WHERE kec BETWEEN 20 AND 30

--  menampilkan isi tabel populasi dimana nilai kolom penduduk antara 1.000.000 dan 2.000.000:
SELECT * FROM Populasi WHERE penduduk BETWEEN 1000000 AND 2000000

-- menampilkan isi tabel populasi dimana nilai kolom penduduk bukan diantara 1.000.000 dan 2.000.000
SELECT * FROM Populasi WHERE penduduk NOT BETWEEN 1000000 AND 2000000

-- menampilkan tabel daftar_provinsi dimana tanggal diresmikan antara 09-08-1957 hingga 01-01-2017:
SELECT * FROM daftar_provinsi WHERE tanggal_diresmikan BETWEEN '09-08-1957' AND '01-01-2017' 

-- Tampilkan isi tabel daftar_provinsi dimana tanggal diresmikan antara 09-08-1957 hingga 01-01-2017, serta tidak termasuk salah satu dari kota ‘Denpasar’, ‘Jakarta’, dan ‘Medan
SELECT * FROM daftar_provinsi WHERE (tanggal_diresmikan BETWEEN '09-08-1957' AND '01-01-2017') AND ibukota not IN ('Denpasar', 'Jakarta', 'Medan')
