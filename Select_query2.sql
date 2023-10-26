-- SELECT nama_kolom FROM nama_table LIMIT jumlah_baris;
-- SELECT nama_kolom FROM nama_table LIMIT offset, jumlah_baris;
-- query ini berfungsi untuk membatasi jumlah baris yang ditampilkan 
-- jumlah_baris => mengacu pada jumlah baris yang ditampilkan
-- offset => mengacu pada berapa banyak baris yang dilompati

-- menampilkan 5 provinsi dengan jumlah kelurahan tertinggi dari tabel populasi
SELECT kota FROM Populasi ORDER BY kel DESC LIMIT 5

-- menampilkan tabel populasi untuk posisi ke 6, 7 dan 8 berdasarkan jumlah kelurahan
SELECT * FROM Populasi ORDER BY kel ASC LIMIT 5, 3 

-- menampilkan provinsi urutan 5 dan 6 jika dihitung berdasarkan luas wilayah
SELECT * FROM Populasi ORDER BY luas DESC LIMIT 4,2

-- SELECT nama_kolom FROM nama_table WHERE condition 
-- Query ini berfungsi untuk memfilter data yang ditampilkan atau membatasi hasil tampilan berdasarkan kondisi tertentu 
-- condition => perintah penting untuk menjalankan logic tertentu 

-- Misalnya saya ingin menampilkan data tabel populasi yang memiliki id_kota = 5
SELECT * FROM Populasi WHERE id_kolom = 5

-- menampilkan data tabel populasi dimana kolom kota berisi string Jakarta:
SELECT * FROM Populasi WHERE kota = 'Jakarta'

-- melihat daftar nama kota yang memiliki luas kurang dari 300 km2
SELECT kota FROM Populasi WHERE luas < 300

-- menampilkan data tabel populasi yang id_kota-nya selain 1
SELECT * FROM Populasi WHERE id_kolom != 1

-- menampilkan kota dengan jumlah kecamatan = 16 dan jumlah kelurahan = 177
SELECT kota FROM Populasi WHERE kec = 16 AND kel = 177

-- menampilkan data tabel populasi yang memiliki id_kota 6 atau 9
SELECT * FROM Populasi WHERE id_kolom = 6 OR id_kolom = 9

-- Tampilkan isi tabel populasi untuk kota Medan dan Jakarta
SELECT * FROM Populasi WHERE kota = 'Medan' OR kota =  'Jakarta'

-- Tampilkan kota dengan jumlah kecamatan lebih dari 20 dengan luas kota kurang dari 300km
SELECT kota FROM Populasi WHERE kec > 20 AND luas < 300

-- Tampilkan kota dengan jumlah kecamatan lebih dari 20 atau luas kota kurang dari 300km2
SELECT kota FROM Populasi kec > 20 OR luas < 300 

-- Tampilkan kota dengan jumlah penduduk antara 1.000.000 hingga 2.000.000
SELECT kota FROM Populasi WHERE penduduk <= 1000000 OR penduduk >= 2000000

-- Tampilkan kota dengan jumlah kecamatan lebih besar dari 20, atau memiliki luas kurang dari 300 km2, dimana setiap kota itu harus memiliki jumlah penduduk kurang dari 2.000.000
SELECT kota FROM Populasi WHERE (kec > 20 OR luas < 300) AND penduduk < 2000000

-- tanda kurung menunjukan urutan kondisi yang perlu dijalankan terlebih dahulu 
-- perintah AND lebih diprioritaskan ketimbang perintah OR didalam mysql 

-- seluruh kota yang memiliki kecamatan lebih dari 20 akan ditampilkan, meskipun luasnya lebih dari 300 dan jumlah penduduknya lebih dari 2000000
SELECT kota FROM Populasi WHERE kec > 20 OR (luas > 300 AND penduduk > 2000000)

/*
Tampilkan kolom prov dan tanggal_diresmikan dari tabel daftar_provinsi, serta kolom kota,
penduduk, kec, dan kel dari tabel populasi, dimana isi kolom ibukota dari tabel daftar_-
provinsi sama dengan nama kota dari tabel populasi
*/

SELECT prov.prov, prov.tanggal_diresmikan, pop.kota, pop.penduduk, pop.kec, pop.kel 
FROM Populasi AS pop, daftar_provinsi AS prov 
WHERE pop.kota = prov.ibukota;

