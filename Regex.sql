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

/*
  Negasi Kumpulan Karakter
    Negasi kumpulan karakter berfungsi untuk membalikan logika dari sekumpulan karakter, dengan menyertakan simbol '^'
    
    -- menampilkan data provinsi dimana nama ibukota setidak memiliki satu huru B yg diikuti selain huruf vokal
    SELECT * FROM Provinsi WHERE Ibukota RLIKE 'B[^aiueo]'
    
    -- menampilkan data provinsi dimana nama ibukota setidaknya memiliki satu huruf J yg diikuti dengan huruf vokal
    SELECT * FROM Provinsi WHERE Ibukota RLIKE '^J[aiueo]'  
*/

/*
  Pola lpgika OR
    Pola logika OR digunakan untuk membuat kondisi logika 'or' yang berfungsi sebagai alternatif pola
    Untuk membuat logika OR digunakan simbol "|"
    
    -- menampilkan data provinsi dimana nama ibukota berisi string ta, ba atau pa
    SELECT * FROM Provinsi WHERE Ibukota RLIKE 'ta|ba|pa'
    
*/

/*
  Membatasi jumlah karakter
    Regex juga dapat membatasi jumlah karakter tertentu, misalnya digit angka harus ditulis sebanyak 8-12 kali untuk proses validasi
    Karakter yang digunakan untuk membatasi jumlah karakter adalah simbol { dan }
    
    -- Menampilkan daftar provinsi dimana nama ibukota setidaknya memiliki 2 buah huruf s
    SELECT * FROM Provinsi WHERE Ibukota RGLIKE 'S{2}'
    
    -- menampilkan string dimana karakternya berisi aaa99
    SELECT 'aaa99' RGLIKE 'a{3}9{2}'
    
   Selain membatasi jumlah karakter regex juga dapat menentukan jangkauan jumlah karakter
   Dengan cara menempatkan 2 digit angka didalam {} seperti {2, 4} angka pertama menunjukan
   jumlah minimum sedangkan angka kedua menunjukan jumlah maksimum
   
   -- menampilkan data provinsi dimana nama ibukota memiliki 3 huruf a dan maksimal 4
   SELECT * FROM Provinsi WHERE ibukota RGLIKE 'a{2,4}
*/

/*
  Beberapa karakter khusus pada regex : 
    - * berfungsi seperti {0,} Artinya cocok dengan 0 atau lebih karakter(tidak dibatasi)
    - + berfungsi seperti {1,} Artinya cocok dengan 1 karakter atau lebih(tidak dibatasi)
    - ? berfungsi seperti {0,1} Artinya cocok dengan 0 atau 1 karakter(tidak boleh lebih)
   
   -- menampilkan data provinsi dimana nama ibukota diawali dengan huruf j, kemudian diikuti dengan tanpa atau beberapa huruf a dan diakhiri dengan a
   SELECT * FROM Provinsi WHERE ibukota RLIKE 'ja*a'
   
   -- menampilkan data provinsi dimana nama ibukota diawali dengan huruf S kemudian diikuti dengan minimal satu huruf u atau lebih dan diakhiri dengan a
   SELECT * FROM Provinsi WHERE ibukota RLIKE 'Su+a'
   
   
   
*/
