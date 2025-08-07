# Korzystanie z GitHub'a

## Wygenerowanie tokena

1. Wchodzimy na [**https://github.com/settings/tokens**](https://github.com/settings/tokens).

2. Klikamy *Generate new token* -> *Generate new token (classic)*.

3. Wpisujemy nazwę tokena i wybieramy kiedy ma wygasnąć.

4. W *Select scopes* wybieramy pożądane opcje.

5. Klikamy *Generate token*.

6. Kopiujemy token do pliku tekstowego i trzymamy go w bezpiecznym miejscu.

## Przygotowanie przestrzeni roboczej do zajęć:
1. Tworzymy przestrzeń roboczą w katalogu domowym:
```
source /opt/ros/humble/setup.bash
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/
```
2. Klonujemy zawartość repozytorium do katalogu _/src_. Zostaniemy spytani o nazwę użytkownika na GitHub i hasło (tzn. _token_). 
```
git clone <link_to_repository> src/
```
3. Podajemy dane konfiguracyjne tzn. login na GitHub i adres email powiązany z naszym kontem:
```
git config user.name "<username>"
git config user.email "<email>"
```

## :arrow_down: Pobieranie plików na początku zajęć:
1. Przechodzimy do katalogu _/src_, w którym jest lokalna kopia naszego repozytorium:
```
cd ~/ros2_ws/src
```
2. Ściągamy najnowszą wersję. Zostaniemy spytani o nazwę użytkownika na GitHub i hasło (tzn. _token_).
```
git pull
```

## :arrow_up: Wgrywanie plików na koniec zajęć:
1. Przechodzimy do katalogu _/src_, w którym jest lokalna kopia naszego repozytorium:
```
cd ~/ros2_ws/src
```
2. Sprawdzamy, jakie zmiany wprowadziliśmy: 
```
git status
```
3. Dodajemy do repozytorium wszystkie wprowadzone zmiany wraz z krótkim, deskryptywnym opisem. Zostaniemy spytani o nazwę użytkownika na GitHub i hasło (tzn. _token_). 
```
git add --all
git commit -m "<changes_description>"
git push
```
4. Logujemy się na GitHub'a w przeglądarce i sprawdzamy, czy zmiany zostały poprawnie dodane.
