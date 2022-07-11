CREATE TABLE country(
no int auto_increment,
negara varchar(15),
luas_total int,
luas_daratan int,
luas_lautan_km2 int
)

INSERT INTO country VALUES
(1, 'Rusia', 098.246, 1377.742, 720.00),
(null, 'Kanada', 984.670, 093.507, 891.163),
(null, 'Tiongkok', 596.961, 326.410, 270.550)

SELECT * FROM country
