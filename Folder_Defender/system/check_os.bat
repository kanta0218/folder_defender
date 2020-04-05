@echo off
call %~dp0setting.bat
set OS_VER=Unknown
ver | find /i "Version 6.1." > nul
if %ERRORLEVEL% equ 0 GOTO WIN7
ver | find /i "Version 6.2." > nul
if %ERRORLEVEL% equ 0 GOTO WIN8
ver | find /i "Version 6.3." > nul
if %ERRORLEVEL% equ 0 GOTO WIN8_1
ver | find /i "Version 10.0." > nul
if %ERRORLEVEL% equ 0 GOTO WIN10
goto ER

:WIN7
set OS_VER=Windows 7
if not %SETTING_COMPLIANT_OS_VER%==WIN7 goto ER
goto END

:WIN8
set OS_VER=Windows 8
if not %SETTING_COMPLIANT_OS_VER%==WIN8 goto ER
goto END

:WIN8_1
set OS_VER=Windows 8.1
if not %SETTING_COMPLIANT_OS_VER%==WIN8_1 goto ER
goto END

:WIN10
set OS_VER=Windows 10
if not %SETTING_COMPLIANT_OS_VER%==WIN10 goto ER
goto END

:ER
if %SETTING_COMPLIANT_OS_VER%==ALL goto END
echo [ERROR]
echo This software cannot compliant the operating system version^!
echo COMP_OS^: %SETTING_COMPLIANT_OS_VER% / Your PC^: %OS_VER%
echo.
echo If you want to startup with this os version, you must change the setting.bat.
echo.
echo Please press any key.
pause > nul
exit

:END