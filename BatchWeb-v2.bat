@echo off
set md=%~dp0
set name=%~nx0
set title=BatchWeb-v2
set web=
color 70
mode con cols=37 lines=10
title %title%
if %name% == %title%.bat goto Home

:: home
:home
if not exist www.txt goto Setup2
cls
echo =====================================
echo        [1] Set Default Web.
echo        [2] Updating the browser.
echo =====================================
echo      Search or execute a command
echo =====================================
set /p "web=>"
if "%web%" == "1" goto Dweb
if "%web%" == "2" goto Update
for /f "tokens=*" %%A in (www.txt) do (set WebPage= %%A)
start %WebPage%"%web%"
goto home

:: set web
:Dweb
cls
echo =====================================
echo       Select your web browser
echo =====================================
echo [1] : Google
echo [2] : Bing
echo [3] : Yahoo
echo [4] : Ecosia
echo =====================================
set /p "web=>"
if %web% == 1 goto Google
if %web% == 2 goto Bing
if %web% == 3 goto Yahoo
if %web% == 4 goto Ecosia
goto Dweb

:Google
cls
del www.txt
echo https://www.google.fr/search?q=>> www.txt
goto home

:Bing
cls
del www.txt
echo https://www.bing.com/search?q=>> www.txt
goto home

:Yahoo
cls
del www.txt
echo https://fr.search.yahoo.com/search?p=>> www.txt
goto home

:Ecosia
cls
del www.txt
echo https://www.ecosia.org/search?q=>> www.txt
goto home

:: set web
:: setup
:Setup
cls
echo restart BatchWeb
pause
ren %name% %title%.bat
:Setup2
goto Dweb

:Update
cls
set rand=%random%
echo Updating...
powershell -c "Invoke-WebRequest -Uri 'https://github.com/Psyko38/BatchWeb/archive/refs/heads/main.zip' -OutFile '%md%\BatchWeb%rand%.zip'"
start BatchWeb%rand%.zip
cls
echo Unzip e file !
pause
del %name%
exit
