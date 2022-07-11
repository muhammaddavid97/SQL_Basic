

CREATE TABLE film (
no int auto_increment,
judul varchar(100),
pendapatan decimal,
tahun_produksi Year
)

INSERT INTO film VALUES
(null, 'Avatar', 965.087, 2009),
(null, 'Titanic', 772.302, 1997),
(null, 'Star Wars: The Force Awakens', 223.624, 2015),
(null, 'Jurassic World', 713.208, 2015)

SELECT * FROM film
