/*
  Regex (Regular Expression) adalah kumpulan huruf atau karakter yang digunakan untuk proses pencocokan pola(Pattern Matching)
  Regular Expression memiliki fungsi seperti Like tapi lebih powerfull, Proses pencarian dengan menggunakan Regex tidak 
  mempengaruhi besar kecil suatu huruf.
  
  syntax query berikut : 
  
    SELECT nama_kolom FROM nama_table WHERE nama_kolom REGEXP pola_regex
    SELECT nama_kolom FROM nama_table WHERE nama_kolom RLIKE pola_regex
*/

/*
  Pola RegExp sebagai string
    Dalam bentuk paling sederhana pola regex dapat ditulis sebagai string atau kata biasa, MYSQL akan menampilkan hasil selama kata
    tersebut ditemukan tidak peduli dimana posisinya. 
    
    -- menampilkan data pada table populasi yang memiliki nama kota dengan string 'Ba'
    SELECT * FROM Populasi WHERE asal REGEXP 'Ba'
    
    -- menampilkan data pada table prov dimana nama provinsi memiliki kata 'sumatera'
    SELECT * FROM Provinsi WHERE prov REGEXP 'sumatera'
*/
