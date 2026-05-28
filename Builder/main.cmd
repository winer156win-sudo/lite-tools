@echo off
cls
echo What app to build?
echo 1. Simpletype
echo 2. Cmd admin
echo 3. Click Counter
echo 4. Libaries
echo 5. Exit
set /p app=Enter the number of the app you want to build:
if "%app%"=="1" (
    echo Starting building Simpletype...
    ahk2exe.exe /in Simpletype.ahk /out Simpletype.exe /icon icon.ico /base "unicode 32-bit.bin"
    echo cleaning up...
    md build
    move "Simpletype.exe" build
    copy "Settings.ini" build
    copy "keybinds.ini" build
    echo Simpletype built successfully!
    pause
)
if "%app%"=="2" (
    echo Starting building Cmd admin...
    ahk2exe.exe /in "Cmd admin.ahk" /out CmdAdmin.exe /icon icon1.ico /base "unicode 32-bit.bin"
    echo cleaning up...
    md build
    move "CmdAdmin.exe" build
    echo Cmd admin built successfully!
    pause
)
if "%app%"=="3" (
    echo Starting building Click Counter...
    python -m PyInstaller --onefile --icon=icon2.ico "main.py"
    echo cleaning up...
    del build / -q /s
    del main.spec / -q
    cd dist
    move "main.exe" "Click Counter.exe"
    move "Click Counter.exe" ..
    cd ..
    md build    
    move "Click Counter.exe" build
    del dist / -q /s
    echo Click Counter built successfully!
    pause
)
if "%app%"=="4" (
    cls
    echo What library to build?
    echo 1. Tick v1.0.0
    echo 2. Time v1.0.0
    echo 3. Exit
    set /p lib=Enter the number of the library you want to build:
    if "%lib%"=="1" (
        echo Starting building Tick...
        python -m nuitka --module TickV1_0_0.py
        pip install cython
        python setup.py build_ext --inplace
        move "tickV1.0.0.cwhp310-win_amd64.pyd" "Tick.pyd"
        echo Tick built successfully!
        pause
    )
    if "%lib%"=="2" (
        echo Starting building Time...
        python -m nuitka --module timev1.0.0.py
        pip install cython
        python setup2.py build_ext --inplace
        echo cleaning up...
        move "timev1.0.0.cwhp310-win_amd64.pyd" "Time.pyd"
        md build
        move "Time.pyd" build
        echo Time built successfully!
        pause
    )
    if "%lib%"=="3" (
        echo Exiting...
        exit
    )
)
if "%app%"=="5" (
    echo Exiting...
    exit
)