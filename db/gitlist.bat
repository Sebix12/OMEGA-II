@echo off
echo Install DataBase Files?
set /p dep=y/n$
if "%dep%" == "n" goto :ext
if "%dep%" == "y" echo installing
::start
set github=https://raw.githubusercontent.com/Sebix12/OMEGA-II-plugin-repo/main/
::vars end

::files
set gitlistpl=editor
powershell -Command "(New-Object Net.WebClient).DownloadFile('%github%%gitlistpl%.db', '%gitlistpl%.db')" && if exist %gitlistpl%.db echo downloaded tool - %gitlistpl%
set gitlistpl=download
powershell -Command "(New-Object Net.WebClient).DownloadFile('%github%%gitlistpl%.db', '%gitlistpl%.db')" && if exist %gitlistpl%.db echo downloaded tool - %gitlistpl%

::exit
:ext