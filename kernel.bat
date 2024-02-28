@if "%debug%" == "false" echo off
set kernelver=1.0
title OMEGA - kernel
if "%1" == "fs" goto :fs
if "%1" == "checkup" goto :checkup
if "%1" == "plugin" goto :plugin
if "%1" == "crypt" goto :crypt


::-----------------
:fs
if "%2" == "del" goto :f_del
if "%2" == "mkdir" goto :f_mkdir
if "%2" == "rmdir" goto :f_rmdir

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

:checkup
echo kernel seems to be fine, running on version: %kernelver%
goto :ext

:plugin
if "%2" == "list" goto :pl_list
if "%2" == "run" goto :pl_run
if "%2" == "remove" goto :pl_remove

:pl_list
call dbm.bat list
goto :pl_ext

:pl_run
call dbm.bat run %3
goto :pl_ext

:pl_remove
call dbm.bat remove %3
goto :pl_ext

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