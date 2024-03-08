@echo off
echo Install DataBase Files?
set /p dep=y/n$
if "%dep%" == "n" goto :ext
if "%dep%" == "y" echo installing
::start
set github=https://raw.githubusercontent.com/Sebix12/OMEGA-II-plugin-repo/main/
::vars end

::files
powershell -Command "(New-Object Net.WebClient).DownloadFile('%github%editor.db', 'editor.db')"
if exist editor.db echo downloaded tool - editor

::exit
:ext