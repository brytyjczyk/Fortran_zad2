# Fortran_zad2
Rozwiązanie zadanie nr 2 na zajęcia z programowania w jezyku Fortran.
# Uwaga uruchomieniowa
Do plików ścieżka jest określona taka jaką ja mam na komputerze, dlatego trzeba zwrócić na to uwagę przed uruchamianiem.
do uruchomienia jest potrzebna biblioteka z plikiem fftw3.f03, która również znajduje się w pliku src, jest ona generowana automatycznie podczas instalacji fftw. 

# Sprawozdanie
# Zamień sygnał na sumę sygnałów 

x=sin(2∗π∗t∗200) + 2∗sin(2∗π∗t∗400)

Dla powyższego sygnału wykres prezentuje się następująco:

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/signalTime.pdf)

Wynik po Transformacie Fouriera

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/signalFreq.pdf)

Obserwując wyniki możemy wysnuć poniższe wnioski:
Ilość wybrzuszeń świadczy o ilosci składowych sinusoid na nasz sygnał, co jest zgodne z wejściowym sygnałem.
Częstotliwości tych sinusoid to 200 Hz i 400Hz.

# Usuwanie szumów

Wykres zwykłego sinusa, bez szumów, czysty.

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/clearSinus.pdf)

Sinus wraz z naniesionym szumem

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/noisySinus.pdf)

wynik transformaty fouriera na zaszumionym sygnale

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/sinusNoisyF.pdf)

usunięcie szumów z zaszumionej transformaty Fouriera

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/sinusClearedF.pdf)
Po otrzymaniu jednego sygnału - jednej wybijającej się częstotliwości, możemy utworzyć sygnał w funkcji czasu odszumionego sinusa

![](https://github.com/brytyjczyk/Fortran_zad2/blob/master/res/sinusClearedTime.pdf)
Możemy zauważyć, ze sygnał jest niemal identyczny, co świadczy o poprawności Transformaty Fouriera oraz jej użyciu w powyższym zadaniu.
