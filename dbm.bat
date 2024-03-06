@if "%debug%" == "false" echo off
cd %db%
if "%1" == "compile" goto :compile
if "%1" == "decompile" goto :decompile
if "%1" == "encode" goto :encode
if "%1" == "decode" goto :decode
if "%1" == "list" goto :list
if "%1" == "run" goto :run
if "%1" == "remove" goto :remove
if "%1" == "get" goto :getpl



::----------------crypt-----------------
:encode
certutil -encode %2.bat %2.db >> NUL
del /q %2.bat
goto :ext

:decode
certutil -decode %2.db %2.bat >> NUL
del /q %2.db
goto :ext
::----------------crypt-----------------

::compile decompile


:compile
cd %defloc%
tar -cf db.zip %db%*
cd %db%
goto :ext

:decompile
tar -xf db.zip -C %db%
goto :ext

::-----------------



:list
echo not working rn 
goto :ext

:run
if not exist %2.db goto :runnotexist 
certutil -decode %2.db %2.bat >> NUL
call %2.bat
del /q %2.bat
goto :ext

:runnotexist
echo %2 does not exist try "help"
goto :ext

:remove
if exist %2.bat del /q %2.bat
if exist %2.db del /q %2.db
goto :ext

:getpl
echo downloading %2
if exist %2.db echo %2 is already downloaded
if exist %2.db goto :ext
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II-plugin-repo/main/%2.db', '%2.db')"
if exist %2.db echo downloaded
if not exist %2.db echo download failed
goto :ext

:ext
cd %defloc%