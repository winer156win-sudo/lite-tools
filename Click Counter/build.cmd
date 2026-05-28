echo off
echo Whick one?
echo 1. Compile with icon
echo 2. Compile without icon
set /p choice=Enter your choice (1 or 2):
if "%choice%"=="1" (goto cwi)
if "%choice%"=="2" (goto cwoi)
echo Invalid choice.
pause
:cwi
if not exist "icon.ico" (
    echo icon not found.
    goto exit
)
if not exist "main.py" (
    echo Script not found.
    goto exit
)
pyinstaller --onefile --icon=icon.ico main.py
goto exit

:cwoi
if not exist "main.py" (
    echo Script not found.
    goto exit
)
pyinstaller --onefile main.py
exit: