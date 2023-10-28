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
