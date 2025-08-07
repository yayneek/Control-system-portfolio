<h1 align="center">Projekt pierwszy :robot:</h1>
<h3 align="center">Programowanie w ROS, semestr 24L</h3>


## Treść zadania

### :arrow_right: Etap 1 (4 punkty)
1. Utwórz przestrzeń roboczą (_workspace_) i sklonuj zawartość swojego repozytorium GitHub z organizacji _Programowanie w ROS_ do katalogu _/src_. 
- Do sklonowania repozytorium wykorzystaj komendę `git clone`.
- Jeżeli po sklonowaniu repozytorium w katalogu _/src_ znajduje się plik README.md, można przejść do kolejnego podpunktu. 
2. Utwórz _python'owy_ pakiet (w poleceniu tworzącym pakiet zawrzyj `--build-type ament_python`) i uzupełnij brakujące informacje tzn. dane autora oraz opis pakietu w plikach _package.xml_ i _setup.py_. 
3. Uruchom węzeł `turtlesim_node` z pakietu `turtlesim` i korzystając z konsolowych narzędzi ROS 2:
- ustal, na którym temacie publikowane sa informacje o pozycji żółwia,
- przeanalizuj strukturę wiadomości publikowanych na tym temacie (wskazówka: `ros2 interface show ...`).
4. Utwórz w swoim pakiecie węzeł ROS 2, który podczas sterowania żółwiem z wykorzystaniem klawiatury (wykorzystując węzeł `turtle_teleop_key` z pakietu `turtlesim`) będzie wyświetlał w terminalu komunikaty o następującym formacie:
```
I am currently at x=<pozycja_x> and y=<pozycja_y>.
```
5. Zbuduj utworzony pakiet i zaprezentuj Prowadzącemu działanie węzła uruchamiając go komendą `ros2 run`.

### :arrow_right: Etap 2 (7 punktów)
6. Rozbuduj węzeł z pliku [**_template.py_**](https://github.com/ROS-MEiL-24L/course_materials/blob/main/lab2/template.py) (plik znajdziesz w katalogu **/lab2** tego repozytorium), który będzie sterował żółwiem w taki sposób, aby napisał on na ekranie literę P. W tym celu:
- sprawdź, na jakich tematach nasłuchuje wezeł `turtlesim_node` z pakietu `turtlesim` i znajdź temat, na którym można publikować prędkość ruchu żółwia,
- ustal strukturę wiadomości wykorzystywanej przy przesyłaniu prędkości ruchu żółwia.
7. Zapewnij możliwość uruchomienia węzła komendą `ros2 launch <package_name> <launch_file_name>`.
8. Zbuduj utworzony pakiet i zaprezentuj Prowadzącemu działanie węzła uruchamiając go komendą `ros2 run` oraz `ros2 launch`.
### Wskazówka :star:
Przy rysowaniu litery wykorzystaj sterowanie prędkościowe. Jeżeli chcesz, aby żółw przesunął się np. 1 metr do przodu, zadaj prędkość ruchu równą 1 m/s i odczekaj 1 sekundę przed opublikowaniem kolejnej wiadomości z prędkością żółwia.

### :arrow_right: Etap 3 (6 punktów)
9. W węźle ROS 2 z etapu drugiego zadeklaruj parametr `letter`, który będzie decydował o tym, jaką literę ma narysować żółw. Przypisz temu parametrowi domyślą wartość `"P"` - wykorzystasz w ten sposób trajektorię ruchu opracowaną w etapie drugim. 
10. Dodaj opis parametru `letter`, aby komendą `ros2 param describe <node_name> letter` można było wyświetlić informację, za co odpowiedzialny jest ten parametr.
11. Zmodyfikuj kod węzła w taki sposób, aby po jego uruchomieniu poniższym poleceniem żółw narysował na ekranie kształt litery K:
```
ros2 run <package_name> <node_name> --ros-args -p letter:=K
``` 
12. Zbuduj utworzony pakiet i zaprezentuj Prowadzącemu działanie węzła. Żółw ma być w stanie narysować literę "P" lub literę "K" w zależności od wartości parametru `letter` przekazywanego podczas uruchamiania węzła.

### :arrow_right: Etap 4 (3 punkty)
13. Wykorzystując narzędzie _rqt\_plot_ wizualizuj na bieżąco prędkość kątową żółwia wokół osi Z w czasie gdy rysuje on literę K. 
14. Uruchom węzeł z etapu trzeciego i wykorzystując narzedzie _rqt\_graph_ wyświetl strukturę utworzonego systemu i zaprezentuj ją Prowadzącemu.