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

/*
  Menandakan Awal dan Akhir Pola
    Untuk mengatur penempatan pola apakah diawal atau diakhir, Regex memiliki dua karakter khusus :
     - ^= Sebagai karakter penanda awal pola, jika regex ditambahkan karakter ini maka pola tersebut harus berada di awal string
     - $= Sebagai karakter penanda akhir pola, jika regex ditambahkan karakter ini maka pola tersebut harus berada di akhir string
     
     -- menampilkan data provinsi dimana nama ibukota diawali dengan huruf B
     SELECT * FROM Provinsi WHERE Ibukota RLIKE '^B'
     
     -- menampilkan data provinsi dimana nama ibukota diakhiri dengan huruf g
     SELECT * FROM Provinsi WHERE Ibukota RLIKE 'g$'
*/

/*
  Kumpulan karakter 
    Regex dapat membuat pola sekumpulan karakter dimana kumpulan karakter ini ditempatkan di tanda ([])
    
    -- menampilkan data provinsi dimana nama ibukota setidaknya memiliki satu huruf S diikuti dengan huruf vokal
    SELECT * FROM Provinsi WHERE Ibukota RLIKE 'S[aiueo]'
    
    -- menampilkan data provinsi dimana nama ibukota setidaknya memiliki satu huruf B diikuti dengan huruf antara A sampai E
    SELECT * FROM Provinsi WHERE Ibukota RLIKE 'b[A-E]'
    
    
*/
