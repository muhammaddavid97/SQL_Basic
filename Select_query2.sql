-- membuat table provinsi

CREATE TABLE daftar_provinsi (
prov varchar(30) not null,
ibukota varchar(30) not null,
luas int not null,
tanggal_diresmikan date not null
)

INSERT INTO daftar_provinsi VALUES 
('Sumatera Utara', 'Medan', 72981, '1956-11-29'),
('Sumatera Barat', 'Padang', 42297, '1957-08-09'),
('Jawa Barat', 'Bandung', 35245, '1950-07-04'),
('Jawa Tengah', 'Semarang', 33987, '1950-07-04'),
('Sulawesi Selatan', 'Makassar', 46116, '1960-12-13'),
('Bali', 'Denpasar', 5561, '1958-08-14'),
('Sumatera Selatan', 'Palembang', 85679, '1950-08-14'),
('Papua Barat', 'Manokwari', 114566, '1999-10-04')

-- identifier qualifiers adalah cara penulisan query untuk table / database dengan lengkap
-- menampilkan nama kolom prov dan ibukota dengan format identifier qualifiers
SELECT daftar_provinsi.prov, daftar_provinsi.ibukota FROM daftar_provinsi

-- menampilkan kolom yang berada di dua table berbeda yaitu kolom prov dari daftar_provinsi dan penduduk serta kota dari table 
-- populasi 

SELECT daftar_provinsi.prov, populasi.penduduk, populasi.kota
FROM daftar_provinsi, populasi
WHERE daftar_provinsi.ibukota = populasi.kota

/*
Tampilkan kolom prov dan tanggal_diresmikan dari tabel daftar_provinsi, serta kolom kota,
penduduk, kec, dan kel dari tabel populasi, dimana isi kolom ibukota dari tabel daftar_-
provinsi sama dengan nama kota dari tabel populasi.
*/

SELECT daftar_provinsi.prov, daftar_provinsi.tanggal_diresmikan, populasi.kota, populasi.penduduk, populasi.kec, populasi.kel
FROM daftar_provinsi, populasi
WHERE daftar_provinsi.ibukota = populasi.kota

/*
	SELECT in digunakan untuk menampilkan data berdasarkan proses himpunan. format query sebagai berikut
    
    SELECT nama_kolom FROM nama_table WHERE nama_kolom in (nilai1, nilai2, nilai3...)
*/

-- menampilkan tabel populasi dimana kolom kota ada di dalam himpunan Jakarta, Bandung dan Medan:
SELECT * FROM populasi WHERE kota in ('Jakarta', 'Bandung', 'Medan')

-- Not in berfungsi sama seperti in akan tetapi data yang dihimpun kebalikan dari operator in
SELECT * FROM populasi WHERE kota not in ('Jakarta', 'Bandung', 'Medan')

-- menampilkan data pada table populasi dimana kolom kota table populasi termasuk ke dalam himpunan pada kolom
-- ibukota pada table daftar_provinsi
SELECT * FROM populasi WHERE kota in (SELECT ibukota FROM daftar_provinsi)

/*
	Query ANY dan SOME berfungsi untuk mengecek salah satu data himpunan subquery. format penulisan query
    
    SELECT nama_kolom FROM nama_table WHERE nama_kolom = ANY (subquery)
    SELECT nama_kolom FROM nama_table WHERE nama_kolom = SOME (subquery)
*/

-- Tampilkan seluruh data yang ada di tabel populasi, dimana nama kotanya sama dengan salah satu himpunan nama ibukota yang ada di dalam tabel daftar_provinsi
SELECT * FROM populasi WHERE kota = ANY (SELECT ibukota FROM daftar_provinsi)

/*
	SELECT EXIST berfungsi untuk memeriksa sebuah subquery apakah datanya ada atau tidak, jika ada maka mengembalikasn true
    jika tidak ada maka mengembalikan false. format sebagai berikut 
    
    SELECT EXIST (sub query)
    SELECT nama_kolom FROM nama_table WHERE EXIST (subquery)
*/

SELECT EXISTS (SELECT * FROM populasi WHERE kota = 'Jakarta')  -- true
SELECT EXISTS (SELECT * FROM populasi WHERE kota = 'Lampung') --  false
