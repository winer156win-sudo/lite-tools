@echo off
cls
echo ================================
echo Temporary Files Cleaner
echo ================================
echo This script will clean up temporary files from your system.
dir /s %TEMP%
dir /s localappdata\temp
dir /s %WINDIR%\Temp
dir /s %USERPROFILE%\AppData\Local\Temp
dir /s %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache
dir /s %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies
dir /s %USERPROFILE%\AppData\Local\Microsoft\Windows\INetHistory
dir /s %USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache
dir /s %USERPROFILE%\AppData\Local\Microsoft\Windows\WebCacheV01.dat
echo Press any key to continue...
pause >nul
del /s /b %TEMP%\*.* >nul 2>&1
del /s /b localappdata\temp\*.* >nul 2>&1
del /s /b %WINDIR%\Temp\*.* >nul 2>&
del /s /b %USERPROFILE%\AppData\Local\Temp\*.* >nul 2>&1
del /s /b %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.* >nul 2>&1
del /s /b %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies\*.* >nul 2>&1
del /s /b %USERPROFILE%\AppData\Local\Microsoft\Windows\INetHistory\*.* >nul 2>&1
del /s /b %USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache\*.* >nul 2>&1
del /s /b %USERPROFILE%\AppData\Local\Microsoft\Windows\WebCacheV01.dat >nul 2>&1
echo Temporary files have been cleaned.
echo Press any key to exit...
pause >nul
exit