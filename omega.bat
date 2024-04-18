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
if not exist "%kernel%" echo Kernel Not Found Installing
if not exist "%kernel%" goto :getkernel
:contkern
if not exist dbm.bat echo DataBaseManager Not Found Installing 
if not exist dbm.bat goto :getdbm
:contdbm
if not exist db echo DataBase Not Found Installing
if not exist db goto :getldb
:contldb
::dont know what to check so ill put stuff later
goto :start

::code for check
:getkernel
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/kernel.bat', 'kernel.bat')"
if exist "%kernel%" echo installed kernel
echo running checkup
if exist "%kernel%" call "%kernel%" checkup
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
if not defined terminal goto :terminal
if exist "%kernel%" call "%kernel%" %terminal%
if not exist "%kernel%" goto :kernelerror
goto :terminal



::debugging
:kernelerror
echo KERNEL_ERROR -------------------------------------------------------------
echo Kernel is not found trying to download and retrying
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/kernel.bat', 'kernel.bat')"
if exist "%kernel%" echo installed kernel
echo KERNEL_ERROR -------------------------------------------------------------
if exist "%kernel%" goto :execcommand
if not exist "%kernel%" goto :kernelerrorgetkernelerror
goto :terminal

:kernelerrorgetkernelerror
echo download failed, exitting.
pause
exit
goto :terminal