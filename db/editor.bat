title Redacteds batch editor
cd %defloc%

:terminal
set terminal=
set /p terminal="editor>"
goto :execcommand

:execcommand
if "%terminal%" == "read" goto :read
if "%terminal%" == "write" goto :write
if "%terminal%" == "edit" goto :edit
if "%terminal%" == "exit" goto :ext
goto :terminal

:read
set /p editorfile="editor\%terminal%\file>"
type %editorfile%
echo.
goto :terminal


:write
set /p editorfile="editor\%terminal%\file>"
set /p editorfiledata="editor\%terminal%\file\data>"
echo %editorfiledata% >> %editorfile%
echo.
goto:terminal


:edit
set /p editorfile="editor\%terminal%\file>"
if not exist %editorfile% echo. >> %editorfile%
:editorstart
cls
type %editorfile%
echo.
set /p editordata="write>"
if "%editordata%" == "exit" goto :editorend
echo %editordata% >> %editorfile%
goto :editorstart
:editorend
goto :terminal

:ext
cd %db%