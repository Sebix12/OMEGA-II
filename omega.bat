@set debug=false
@if "%debug%" == "false" echo off
if not exist help.db echo installing help
if not exist help.db powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/help.db', 'help.db')"

title OMEGA
cls

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
if exist kernel.bat echo installed kernel 
goto :contkern
::------------
:getdbm
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/dbm.bat', 'dbm.bat')"
echo downloaded dbm
goto :contdbm
::------------
:getldb
if not exist db mkdir db
cd %db%
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/db/gitlist.bat', 'gitlist.bat')"
if exist gitlist.bat call gitlist.bat
if exist gitlist.bat echo downloaded github list
if not exist gitlist.bat echo gitist does not exist
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
call "%kernel%" %terminal%
goto :terminal