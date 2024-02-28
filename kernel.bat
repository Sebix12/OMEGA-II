@if "%debug%" == "false" echo off
set kernelver=1.0
title OMEGA - kernel
if "%1" == "fs" goto :fs
if "%1" == "checkup" goto :checkup
if "%1" == "plugin" goto :plugin


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

:pl_run

:pl_remove







:ext