## Descriere

Problema pentru aflarea celor mai apropiate 3 cafenele sa realizat in limbajul de programare Ruby, pentru aflarea distantei dintre doua puncte sa folosit formula euclidiana dintre 2 puncte intr-un plan.
Aplicatia primeste datele cu locatiile cafenelelor dintr-un fisier CSV, iar user-ul introduce coordonatele sale plus url-ul fisierului CSV in linia de comanda.
Programul are mesaje de eroare pentru coordonatele gresite ale userului, eroare la descarcarea datelor din CSV, cat si erori ale continutului gresit din CSV, se pot vedea mai multe la partea de testare a programului, unde sa creat un fisier CSV personalizat cu diferite greseli.

## Testare

Rularea programului:

In linia de comanda sa adugat coordonaterle "47.6" "-122.4" si url-ul fisierului CSV 
<img width="885" alt="Screenshot 2025-02-19 at 16 33 55" src="https://github.com/user-attachments/assets/cb216f79-39ef-4ea2-9c18-91a8a81ecc53" />

User-ul a adugat mai multe argumente, iar programul nea avertizat ca trebuie sa fie de forma: "user  x coordinate" "user y coordinate" "shop data url"
<img width="919" alt="Screenshot 2025-02-19 at 16 38 26" src="https://github.com/user-attachments/assets/3aabbddb-c955-4ff3-99f6-ab0ba5319799" />

Adaugare url gresit
<img width="881" alt="image" src="https://github.com/user-attachments/assets/18c448d5-e695-48bc-a182-82541f241901" />

Testare cu o coloana lipsa la linia 1 din CSV

<img width="438" alt="image" src="https://github.com/user-attachments/assets/3d9f3ce4-7e4f-42a6-a9ac-179fb5edc65c" />
<img width="884" alt="image" src="https://github.com/user-attachments/assets/365d9c7a-8a1c-4c8b-903b-ea1c119f3676" />

Testare cu valoare lipsa la o coloana din linia 1
![image](https://github.com/user-attachments/assets/405079d7-5819-413c-9c3a-8715650307ce)
<img width="882" alt="image" src="https://github.com/user-attachments/assets/9f52b918-e33a-4787-954c-abdcd7397198" />

Testare coordonata invalida la linia 1

<img width="437" alt="image" src="https://github.com/user-attachments/assets/128f758e-48c2-4172-9b50-b9f8cf949d5f" />
<img width="882" alt="image" src="https://github.com/user-attachments/assets/561ef1d1-0063-47b9-9a9f-e77321bab06b" />

Testare cu un CSV gol
<img width="882" alt="image" src="https://github.com/user-attachments/assets/fb55635e-c5b5-49fc-9f22-fb1e7e8687da" />

## Instalare si utilizare

Clonare repo:

git clone https://github.com/razvan1x/coffee_finder

Navigare in folderul proiectului:

cd coffee_finder

Rulare:

ruby coffee_finder.rb "user x coordinate" "user y coordinate" "shop_data_url"

Exemplu:

ruby coffee_finder.rb 47.6 -122.4 https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv
