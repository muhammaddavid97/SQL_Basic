/*
	SELECT LIKE digunakan untuk melakukan proses pencarian berdasarkan pola pattern. format penulisan query
    
    SELECT nama_kolom FROM nama_table WHERE nama_kolom LIKE pola
    
    menyediakan 2 karakter khusus untuk pola pencarian
    • _ : karakter ganti yang cocok untuk satu karakter apa saja.
	• % : karakter ganti yang cocok untuk karakter apa saja dengan panjang karakter tidak
		  terbatas, termasuk tidak ada karakter.
*/

-- menampilkan tabel populasi dimana nama kota diawali dengan huruf B:
SELECT * FROM populasi WHERE kota LIKE 'B%'

-- menampilkan tabel daftar_provinsi yang nama provinsinya diawali string Sumatera:
SELECT * FROM daftar_provinsi WHERE prov LIKE 'Sumatera%'

/*
	SELECT UNION berfungsi untuk menggabungkan dua atau lebih query SELECT. dimana jumlah kolom pada query SELECT pertama harus
    sama dengan jumlah kolom pada query select kedua jika tidak akan menampilkan error. format query sebagai berikut
    
    SELECT nama_kolom1, [nama_kolom2] FROM nama_table1
    UNION
    SELECT nama_kolom3, [nama_kolom4] FROM nama_table2
    
    secara default query UNION hanya akan menampilkan satu data yang nilainya sama diantara ke dua table
*/

-- menggabungkan kolom kota dari tabel populasi dengan kolom ibukota dari tabel daftar_provinsi:
SELECT kota AS 'Daftar kota' FROM populasi UNION SELECT ibukota FROM daftar_provinsi

-- menampilkan kolom kota pada table populasi dan kolom ibukota pada table daftar_provinsi secara bersamaan 
-- kemudian urutkan data secara descending
SELECT kota FROM populasi UNION SELECT ibukota FROM daftar_provinsi ORDER BY kota DESC
