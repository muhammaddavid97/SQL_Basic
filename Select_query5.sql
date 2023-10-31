-- SELECT nama_kolom FROM nama_table1 JOIN nama_table2 ON table_kolom1.nama_table1 = table_kolom2.nama_table2
-- query JOIN digunakan untuk menggabungkan beberapa table 
-- ada beberapa jenis JOIN : 
	-- inner join => proses menampilkan data pada beberapa table dimana datanya tersedia di beberapa table tersebut
	-- left join => proses menampilkan data pada beberapa table dimana data di table sebelah kiri ditampilkan seluruhnya
	-- meskipun beberapa data tidak memiliki irisan
	-- right join => proses menampilkan data pada beberapa table dimana data di table sebelah kanan ditampilkan seluruhnya
	-- meskipun beberapa data tidak memiliki irisan


-- menampilkan kolom nama dan jurusan dari tabel mahasiswa, serta kolom dekan dari tabel universitas
SELECT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM mahasiswa mhs, universitas univ 
WHERE mhs.jurusan = univ.jurusan

-- menggunakan query inner join 
SELECT DISTINCT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM mahasiswa mhs 
INNER JOIN universitas univ ON mhs.jurusan = univ.jurusan 

-- menggunakan left join 
SELECT DISTINCT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM mahasiswa mhs 
left JOIN universitas univ ON mhs.jurusan = univ.jurusan 

-- menggunakan right join 
SELECT DISTINCT mhs.nama, mhs.jurusan, univ.nama_dekan
FROM mahasiswa mhs 
right JOIN universitas univ ON mhs.jurusan = univ.jurusan 

/*
Tampilkan kolom provinsi dan ibukota dari tabel daftar_provinsi serta kolom kelurahan
dan kecamatan dari tabel populasi. Seluruh provinsi tetap ditampilkan meskipun tidak memiliki
pasangan di tabel populasi
*/

SELECT prov.provinsi AS Provinsi, prov.ibukota AS IbuKota, pop.kel AS Kelurahan, pop.kec AS Kecamatan
FROM daftar_provinsi prov 
LEFT JOIN populasi pop ON prov.ibukota = pop.asal 

