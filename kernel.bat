@if "%debug%" == "false" echo off
set kernelver=1.9.2
title OMEGA - kernel
if "%1" == "fs" goto :fs
if "%1" == "checkup" goto :checkup
if "%1" == "plugin" goto :plugin
if "%1" == "pl" goto :plugin
if "%1" == "crypt" goto :crypt
if "%1" == "cls" goto :cls
if "%1" == "exit" goto :ext_all
if "%1" == "help" goto :kernel_help
if "%1" == "kernel" goto :kernel
if "%1" == "debug" goto :debug
if "%1" == "dir" dir /b && goto :ext
echo command not found
goto :ext



:debug
if "%2" == "off" echo off
if "%2" == "off" set debug=false
if "%2" == "on" echo on
if "%2" == "on" set debug=true
goto :ext

:cls
cls
goto :ext

:ext_all
exit



::-----------------
:fs
if "%2" == "del" goto :f_del
if "%2" == "mkdir" goto :f_mkdir
if "%2" == "rmdir" goto :f_rmdir
if "%2" == "run" goto :f_run
if "%2" == "compile" goto :compile
if "%2" == "decompile" goto :decompile
echo fs command not found
goto :ext

::-----------------
:compile
call dbm.bat compile
goto :ext

:decompile
call dbm.bat decompile
goto :ext

::-----------------
:kernel
if "%2" == "version" echo kernel version: %kernelver%
if "%2" == "help" goto :kernel_help
goto :ext

:kernel_help
type "%defloc%help.db"
echo.
goto :ext
::-----------------
:f_del
del %3
echo deleted %3
goto :ext
::-----------------
:f_mkdir
mkdir %3
echo created %3
goto :ext

:f_rmdir
rmdir %3
echo deleted %3
goto :ext

::-----------------
:f_run
if not exist %3 echo %3 does not exist, canceling.
if not exist %3 goto :ext
if exist %3 echo %3 found, running it...
call %3
goto :ext
::-----------------

:checkup
echo :----------------------------:
::if exist
if exist %defloc%omega.bat echo omega found
if exist %kernel% echo kernel found : kernel seems to be fine, running on version: %kernelver%
if exist %defloc%help.db echo help db found
if exist %defloc%dbm.bat echo DataBaseManager found
if exist %db% echo DataBase Folder found
::check if not exist
if not exist %defloc%omega.bat echo omega not found
if not exist %kernel% echo kernel not found
if not exist %defloc%help.db echo help db not found
if not exist %defloc%dbm.bat echo DataBaseManager not found
if not exist %db% echo DataBase Folder not found
::install if not found
if not exist %defloc%omega.bat echo installing omega && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/omega.bat', 'omega.bat')"
if not exist %kernel% echo imstalling kernel && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/kernel.bat', 'kernel.bat')"
if not exist %defloc%help.db echo installing help db && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/help.db', 'help.db')"
if not exist %defloc%dbm.bat echo installing DataBaseManager && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/dbm.bat', 'dbm.bat')"
if not exist %db% echo creating DataBase Folder && if not exist db mkdir db | echo folder created && cd %db% && powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/db/gitlist.bat', 'gitlist.bat')" && if exist gitlist.bat call gitlist.bat && cd %defloc% && echo installed Databbase
::exit
echo :----------------------------:
goto :ext

:plugin
if "%2" == "list" goto :pl_list
if "%2" == "run" goto :pl_run
if "%2" == "remove" goto :pl_remove
if "%2" == "get" goto :pl_get
echo plugin subfunc %2 not found
goto :ext

:pl_list
call dbm.bat list
goto :pl_ext

:pl_run
call dbm.bat run %3
goto :pl_ext

:pl_remove
call dbm.bat remove %3
goto :pl_ext

:pl_get
call dbm.bat get %3

:pl_ext
goto :ext

:crypt
if "%2" == "encode" goto :crypt_encode
if "%2" == "decode" goto :crypt_decode

:crypt_encode
call dbm.bat encode %3
goto :ext

:crypt_decode
call dbm.bat decode %3
goto :ext


:ext