-- mendefinisikan tipe data numeric
CREATE TABLE contoh_int1(
a TINYINT,
b SMALLINT,
d INT,
e BIGINT
)

-- mendefinisikan tipe data int 
INSERT INTO contoh_int1 VALUES (
100,
100,
100,
100
)

SELECT * FROM contoh_int1

INSERT INTO contoh_int1 VALUES (
(200), 
(35000), 
(18000000), 
(2500000000), 
(10000000000000000000)
)


-- menginput nilai decimal ke dalam kolom dengan tipe data int
INSERT INTO contoh_int1 VALUES (
(10.34), 
(400.499),
(12345.50),
(143.655),
(999.9999)
)
GO

-- unsigned adalah atribut yang berfungsi untuk mengorbankan nilai negatif untuk mendapatkan jangkauan nilai positif
-- sehingga jangkauannya lebih besar

CREATE TABLE contoh_int2 (
a tinyint,
b smallint unsigned
)

-- mendefinisikan tipe data decimal yang berfungsi untuk menampung angka pecahan
-- DECIMAL [M], [D] 
-- M => menunjukan jumlah digit keseluruhan nilai default 10
-- D => menunjukan jumlah digit di belakang koma nilai default 0
-- nilai maksimal M=65 dan D=30, dengan syarat D tidak boleh lebih besar dari M

CREATE TABLE contoh_dec1(
a decimal,
-- membuat 6 angka dengan 2 angka dibelakang koma
b decimal(6,2),
-- membuat 6 angka dengan 3 angka dibelakang koma
c decimal(6,3),
-- membuat 3 angka dengan 2 angka dibelakang koma
d decimal(3,2)
)

INSERT INTO contoh_dec1 VALUES 
(10, 4563.54, 4563.541, 4.56),
(10, 4563.55, 4563.542, 4.57),
(10, 4563.56, 4563.543, 4.58)

-- tipe data double dan float memiliki karakteristik yang sama dengan tipe data decimal yang membedakan adalah
-- terletak pada cara menyimpan data tersebut di memory dimana double dan float menggunakan sistem floating point

CREATE TABLE contoh_float1(
a float(3,2),
b float(4,2),
c float(5,2)
)
