@if "%debug%" == "false" echo off
cd %db%
if "%1" == "encode" goto :encode
if "%1" == "decode" goto :decode
if "%1" == "list" goto :list
if "%1" == "run" goto :run
if "%1" == "remove" goto :remove



:encode
certutil -encode %2.bat %2.db >> NUL
del /q %2.bat
goto :ext

:decode
certutil -decode %2.db %2.bat >> NUL
del /q %2.db
goto :ext

:list

:run
certutil -decode %2.db %2.bat >> NUL
call %2.bat
del /q %2.bat
goto :ext

:remove
if exist %2.bat del /q %2.bat
if exist %2.db del /q %2.db
goto :ext

:ext
cd %defloc%