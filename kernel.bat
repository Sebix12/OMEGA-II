@if "%debug%" == "false" echo off
set kernelver=1.0
title OMEGA - kernel
if "%1" == "fs" goto :fs
if "%1" == "checkup" goto :checkup
if "%1" == "plugin" goto :plugin


::-----------------
:fs
if "%2" == "del" goto :del
if "%2" == "mkdir" goto :mkdir
if "%2" == "rmdir" goto :rmdir

::-----------------
:del
del %3
echo deleted %3
goto :ext
::-----------------
:mkdir
mkdir %3
echo created %3
goto :ext

:rmdir
rmdir %3
echo deleted %3
goto :ext

::-----------------

:checkup
echo kernel seems to be fine, running on version: %kernelver%
goto :ext

:plugin
echo plugins are in WIP use at your own risk


:ext