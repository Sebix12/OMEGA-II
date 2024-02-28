@set debug=false
@if "%debug%" == "false" echo off
title OMEGA

::vars
set defloc=%~dp0
set db=%defloc%db
set kernel=%defloc%kernel.bat
set currloc=%defloc%
::end

::check everything
if not exist kernel.bat goto :getkernel
:contkern
if not exist dbm.bat goto :getdbm
:contdbm
if not exist db goto :getldb
:contldb
::dont know what to check so ill put stuff later
goto :start

::code for check
:getkernel
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/kernel.bat', 'kernel.bat')"
goto :contkern
::------------
:getdbm
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/dbm.bat', 'dbm.bat')"
goto :contdbm
::------------
:getldb
if not exist db mkdir db
cd %db%
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/db.zip', 'db.zip')"
tar -xf db.zip
del /q db.zip
cd %defloc%
goto :contldb
::------------

::end : start
:start

:terminal
set terminal=
set /p terminal=">"
goto :execcommand

:execcommand
call %kernel% %terminal%
goto :terminal