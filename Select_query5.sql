/*
	SELECT GROUP BY berfungsi untuk mengelompokan data berdasarkan kriteria tertentu. query ini hanya bisa dipakai
    jika didalam table terdapat data duplikat yang bisa kita kelompokan. format sebagai berikut 
    
    SELECT nama_kolom FROM nama_table WHERE kondisi GROUP BY nama_kolom
*/

-- Berapa jumlah mahasiswa yang berasal dari setiap kota
SELECT asal, COUNT(asal) AS jumlah_kota FROM mahasiswa GROUP BY asal ORDER BY jumlah_kota DESC

-- Tampilkan nama jurusan terbanyak yang dipilih mahasiswa

SELECT TOP 1 jurusan, COUNT(jurusan) AS jumlah_jurusan
FROM
mahasiswa
GROUP By
jurusan
ORDER BY 
jumlah_jurusan DESC

-- HAVING berfungsi sebagai perintah untuk memberi suatu kondisi khusus untuk query GROUP BY 
SELECT jurusan, COUNT(jurusan) AS jumlah_jurusan
FROM 
mahasiswa
GROUP BY 
jurusan
HAVING jumlah_jurusan > 1



