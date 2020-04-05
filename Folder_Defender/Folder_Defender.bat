@echo off
rem Charset: Shift-JIS
rem ���̃t�@�C����Shift-JIS�ō쐬����܂���

rem   �X�^�[�g�A�b�v����

echo ============================================================
echo                Folder Defender for Windows OS
echo ============================================================
timeout /t 2 > nul

call %~dp0bin\check.installed.java.bat
call %~dp0system\check_os.bat

set SYSTEM_BUILD_NUMBER=1.0.0-5100.0000.0000.0000


if ""%1""=="""" (
   goto startUp
) else (
   goto DD_Analyze
)

:startUp
title [Folder Defender for Windows OS]
echo.
echo ---------- START-UP ----------
echo STARTUP DATE^: %DATE% %TIME%
echo BUILD NUMBER^: %SYSTEM_BUILD_NUMBER%
title [Folder Defender for Windows OS] %SYSTEM_BUILD_NUMBER%
set CLASSPATH=bin
echo.
echo Hello^!
echo Welcome to Folder Defender.
echo.
echo.
echo.
timeout /t 1 > nul
goto mainMenu

:mainMenu
echo.
echo.
echo.
echo --------------- MAIN MENU ---------------
echo [1] �t�H���_/�t�@�C�������b�N����
echo [2] �t�H���_/�t�@�C�����A�����b�N����
echo [3] �w���v
echo [4] �A�b�v�f�[�g����
echo [5] �I��
echo -----------------------------------------
echo.
set /p USR_MENU="�I�����Ă������� (1�`5) > "

if %USR_MENU%==1 (
   goto MENU1
) else if %USR_MENU%==2 (
   goto MENU2
) else if %USR_MENU%==3 (
   goto MENU3
) else if %USR_MENU%==4 (
   goto MENU4
) else if %USR_MENU%==5 (
   goto MENU5
) else (
   goto mainMenu
)

:MENU1
echo.
echo.
echo.
echo ���b�N����t�H���_/�t�@�C���̃p�X����͂��Ă������� ^(��΃p�X�œ���^)
echo ---------- �J�����g�f�B���N�g�����ړ����� ----------
echo �f�X�N�g�b�v^: #DESKTOP
set /p USR_PATH="(�L�����Z������ꍇ�� #CANCEL ����͂��Ă�������) > "
if "%USR_PATH%"=="#CANCEL" (
   goto mainMenu
) else if "%USR_PATH%"=="#DESKTOP" (
   goto MENU1_Desktop
) else if EXIST "%USR_PATH%" (
   echo ���΂炭���҂���������...
   set GLOBAL_FILE_PATH=%USR_PATH%
   timeout /t 1 > nul
   goto LOCK_FILE
) else if NOT EXIST "%USR_PATH%" (
   echo.
   echo.
   echo.
   echo [ERROR]
   echo �w�肳�ꂽ�t�H���_/�t�@�C��^(%USR_PATH%^)�͑��݂��܂���^!
   echo.
   echo.
   echo.
   goto MENU1
) else (
   goto MENU1
)

:MENU1_Desktop
echo.
echo.
echo.
echo ���b�N����t�H���_/�t�@�C���̃p�X����͂��Ă������� ^(��΃p�X�œ���^)
set /p USR_PATH="(�L�����Z������ꍇ�� #CANCEL ����͂��Ă�������) > %Userprofile%\Desktop\"
if "%USR_PATH%"==#CANCEL (
   goto mainMenu
)
set USR_PATH="%Userprofile%\Desktop\%USR_PATH%"
if EXIST "%USR_PATH%" (
   echo ���΂炭���҂���������...
   set GLOBAL_FILE_PATH=%USR_PATH%
   timeout /t 1 > nul
   goto LOCK_FILE
) else if NOT EXIST "%USR_PATH%" (
   echo.
   echo.
   echo.
   echo [ERROR]
   echo �w�肳�ꂽ�t�H���_/�t�@�C��^(%USR_PATH%^)�͑��݂��܂���^!
   echo.
   echo.
   echo.
   goto MENU1
) else (
   goto MENU1
)

rem Unlock the File.
:MENU2
echo.
echo.
echo.
echo �A�����b�N����t�H���_/�t�@�C���̃p�X����͂��Ă�������
echo �����b�N���ɓo�^�����p�X����͂��Ă�������^!
echo ---------- �J�����g�f�B���N�g�����ړ����� ----------
echo �f�X�N�g�b�v^: #DESKTOP
set /p USR_PATH="(�L�����Z������ꍇ�� #CANCEL ����͂��Ă�������) > "
if %USR_PATH%==#CANCEL (
   goto mainMenu
) else if %USR_PATH%==#DESKTOP (
   goto MENU2_Desktop
) else (
   set GLOBAL_FILE_PATH=%USR_PATH%
   goto UNLOCK_FILE
)

:MENU2_Desktop
echo.
echo.
echo.
echo �A�����b�N����t�H���_/�t�@�C���̃p�X����͂��Ă�������
echo �����b�N���ɓo�^�����p�X����͂��Ă�������^!
set /p USR_PATH="(�L�����Z������ꍇ�� #CANCEL ����͂��Ă�������) > %Userprofile%\Desktop\"
if %USR_PATH%==#CANCEL (
   goto mainMenu
) else (
   set GLOBAL_FILE_PATH=%Userprofile%\Desktop\%USR_PATH%
   goto UNLOCK_FILE
)

:MENU3
echo.
echo.
echo.
echo --------------- HELP MENU ---------------
echo [0] �߂�
echo [1] �g�����K�C�h
echo [2] �I�t���C���w���v
echo -----------------------------------------
echo.
set /p USR_HELPMENU="�I�����Ă������� (0�`2) > "

if %USR_HELPMENU%==0 (
   goto mainMenu
) else if %USR_HELPMENU%==1 (
   echo.
   echo.
   echo.
   echo ==================== How to Use ====================
   call %~dp0help\how_to_use.bat
   goto MENU3
) else if %USR_HELPMENU%==2 (
   call %~dp0help\help.html
   pause
   goto MENU3
) else (
   goto MENU3
)

:MENU4
echo.
echo.
echo.
echo -------------------- �A�b�v�f�[�g���� --------------------
FOR /F "tokens=* usebackq delims=" %%i IN ("%~dp0update\update.history.txt") do (
   echo "%%i" | find ".NL" >NUL
   if not ERRORLEVEL 1 (
      echo.
   ) else (
      echo %%i
   )
)
echo ----------------------------------------------------------
echo.
echo.
goto mainMenu

:MENU5
cls
echo Thank you for using.
echo See you next time^!
timeout /t 2 > nul
exit


:DD_Analyze
echo.
echo.
echo.
setlocal enabledelayedexpansion
set FILE_DD=N
for %%f in (%*) do (
  set FILE_DD=%%f
)
echo ============================================================
call %~dp0system\setting.bat
echo SYSTEM_MODE: D^&D_ANALYZE_MODE
echo.
echo Analyze the data.
echo.
timeout /t 3 > nul
set DD_FILE_PATH=!FILE_DD!
echo FILE PATH: %DD_FILE_PATH:"=%
echo FILE SIZE: %~z1 Bytes
echo ATTRIBUTE: %~a1
echo TIME STUMP: %~t1
echo ============================================================

set /p USR_CONFIRM="���̃t�H���_/�t�@�C�������b�N���܂���? (y/n) > "

if %USR_CONFIRM%==y (
   echo ���΂炭���҂���������...
   set GLOBAL_FILE_PATH=!FILE_DD!
   timeout /t 1 > nul
   goto LOCK_FILE
) else %USR_CONFIRM%==n (
   echo �����𒆒f���܂���^!
   exit
) else (
   goto DD_Analyze
)
endlocal

:LOCK_FILE
if %GLOBAL_FILE_PATH%==C:\ goto CANT_LOCK_3
if %GLOBAL_FILE_PATH%==D:\ goto CANT_LOCK_3
if %GLOBAL_FILE_PATH%==E:\ goto CANT_LOCK_3
if %GLOBAL_FILE_PATH%==F:\ goto CANT_LOCK_3
if %GLOBAL_FILE_PATH%==G:\ goto CANT_LOCK_3
if %GLOBAL_FILE_PATH%==system goto CANT_LOCK_1
if %GLOBAL_FILE_PATH%==system\ goto CANT_LOCK_1
echo "%GLOBAL_FILE_PATH%" | find "%~dp0" >NUL
if not ERRORLEVEL 1 goto CANT_LOCK_1
echo "%~dp0" | find "%GLOBAL_FILE_PATH%" >NUL
if not ERRORLEVEL 1 goto CANT_LOCK_2

echo.
echo.
echo.

echo [CAUTION]
echo �w�肵���t�H���_/�t�@�C���p�X�ɋ󔒕�����_�u���N�H�[�e�V����^(^"^)���܂܂�Ă��Ȃ����m�F���Ă�������^!
echo ��L�̕������܂܂�Ă���Ɛ���Ƀ��b�N�ł��܂���^!
echo.
echo ^> �����𑱍s����ꍇ��Enter�L�[�������Ă������� ^<
pause > NUL
java FileName Check.FileName.Lock "%GLOBAL_FILE_PATH%"
setlocal enabledelayedexpansion
set EXE_LOG=N
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\checkCanLock.log") do (
   set EXE_LOG=%%e
)
timeout /t 1 > nul
if not !EXE_LOG!==PASS (
   echo [ERROR]
   echo �t�@�C���p�X�Ɏg�p�ł��Ȃ��������g���Ă��܂�^!
   echo.
   echo Please press any key.
   pause > NUL
   goto mainMenu
)
endlocal


if not exist %GLOBAL_FILE_PATH% (
   echo [WARNING]
   echo �G���[���x��^: 2
   echo �t�@�C���p�X�̎擾�Ɏ��s���܂���^!
   goto MENU1
)

set /p USR_PASS="�C�ӂ̃p�X���[�h����͂��Ă������� (�ő�: %SETTING_PASS_MAX_LENGTH%����) > "

if ""%USR_PASS%""=="""" (
   echo.
   echo [ERROR]
   echo �p�X���[�h����͂��Ă�������^!
   goto LOCK_FILE
)
set VAL_PASS_OK=true
echo "%USR_PASS%" | find ":" >NUL
if not ERRORLEVEL 1 set VAL_PASS_OK=false
echo "%USR_PASS%" | find "!" >NUL
if not ERRORLEVEL 1 set VAL_PASS_OK=false
if %VAL_PASS_OK%==false (
   echo.
   echo [ERROR]
   echo �p�X���[�h�Ɏg�p�ł��Ȃ��������g�p����Ă��܂�^!
   echo �p�X���[�h�� : ^! ���̓��ꕶ�����܂߂邱�Ƃ͂ł��܂���^!
   goto LOCK_FILE
)

echo %USR_PASS% > %~dp0system\TEMP_PASS.dat
for %%i in (%~dp0system\TEMP_PASS.dat) do set /a SIZE=%%~zi-3
timeout /t 1 >NUL
echo .> %~dp0system\TEMP_PASS.dat
if %SIZE% gtr %SETTING_PASS_MAX_LENGTH% (
   echo.
   echo [ERROR]
   echo �p�X���[�h���������܂�^! ^(�ő�: %SETTING_PASS_MAX_LENGTH%^)
   echo �ő�l��ύX����ꍇ�́Asetting.bat�𒼐ڏ��������Ă�������
   goto LOCK_FILE
) else (
   goto LOCK_FILE_PROCESS
)

:CANT_LOCK_1
echo.
echo.
echo.
echo [ERROR]
echo �w�肳�ꂽ�t�H���_/�t�@�C����FD�V�X�e���t�@�C���ł�^!
echo FD�V�X�e���t�@�C���̓��b�N�ł��܂���^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_2
echo.
echo.
echo.
echo [ERROR]
echo �w�肳�ꂽ�t�H���_/�t�@�C����Folder Defender���܂܂�Ă��邽�߃��b�N�ł��܂���^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_3
echo.
echo.
echo.
echo [ERROR]
echo �h���C�u�����b�N���鎖�͂ł��܂���^!
echo �h���C�u���̃t�H���_/�t�@�C�����w�肵�Ă�������^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_4
echo.
echo.
echo.
echo [ERROR]
echo ���p�X�y�[�X/�S�p�X�y�[�X���܂܂�Ă���t�@�C�������b�N���鎖�͂ł��܂���^!
echo �t�H���_/�t�@�C������ύX���Ă�������^!
echo.
echo.
echo.
goto MENU1


:LOCK_FILE_PROCESS
echo.
echo.
echo.
echo �t�@�C���f�[�^���쐬���ł�...
echo �Ώۃp�X^: %GLOBAL_FILE_PATH%
echo %GLOBAL_FILE_PATH%> %~dp0system\temp\FILEPATH.dat
echo [%TIME%] �t�@�C���p�X�̏o�͂��������܂���
certutil -f -encode %~dp0system\temp\FILEPATH.dat %~dp0system\temp\FILEPATH.enc >NUL
echo [%TIME%] �t�@�C���p�X�̈Í������������܂���
if exist %~dp0system\temp\FILEPATH_2.enc (
   del %~dp0system\temp\FILEPATH_2.enc
   echo [%TIME%] �ꎞ�t�@�C�����폜���܂���
)
echo [%TIME%] �t�@�C���f�[�^�̍č\�����J�n���܂�
type nul > %~dp0system\temp\FILEPATH_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\FILEPATH.enc") do (
   echo %%i>> %~dp0system\temp\FILEPATH_2.enc
)
echo [%TIME%] �t�@�C���f�[�^�̍č\�����������܂���
echo [%TIME%] ���b�N�f�[�^�̍쐬���J�n���܂�
set ENCRYPTED_PATH=N
setlocal enabledelayedexpansion
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\FILEPATH_2.enc") do (
   set ENCRYPTED_PATH=%%e
)
type nul > %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc
echo �p�X���[�h^: %USR_PASS%
echo %USR_PASS%> %~dp0system\temp\USERPASS.dat
echo [%TIME%] �p�X���[�h�̏o�͂��������܂���
certutil -f -encode %~dp0system\temp\USERPASS.dat %~dp0system\temp\USERPASS.enc >NUL
echo [%TIME%] �p�X���[�h�̈Í������������܂���
if exist %~dp0system\temp\USERPASS_2.enc (
   del %~dp0system\temp\USERPASS_2.enc
   echo [%TIME%] �ꎞ�t�@�C�����폜���܂���
)
echo [%TIME%] �p�X���[�h�f�[�^�̍č\�����Ă��܂�...
type nul > %~dp0system\temp\USERPASS_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\USERPASS.enc") do (
   echo %%i>> %~dp0system\temp\USERPASS_2.enc
)
echo [%TIME%] �p�X���[�h�f�[�^�̍č\�����������܂���
set ENCRYPTED_PASS=N
FOR /F "tokens=1 usebackq" %%p IN ("%~dp0system\temp\USERPASS_2.enc") do (
   set ENCRYPTED_PASS=%%p
)
echo !ENCRYPTED_PASS!> %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc
echo [%TIME%] �p�X���[�h�̐ݒ肪�������܂���
echo [%TIME%] �t�@�C��ID���쐬���Ă��܂�...
set length=8
set ask=3
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "& { switch ("%ask%") {"1" {$characters='123456789'}"3" {$characters='ABCDEFGHIJKLMN123456789'}}; -join ${characters}[(1..%length% | ForEach-Object { Get-Random -Maximum ${characters}.length })] }" > %~dp0system\temp\FILE_ID_S.dat
set length=4
set ask=3
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "& { switch ("%ask%") {"1" {$characters='123456789'}"3" {$characters='ABCDEFGHIJKLMN123456789'}}; -join ${characters}[(1..%length% | ForEach-Object { Get-Random -Maximum ${characters}.length })] }" > %~dp0system\temp\FILE_ID_1.dat
set length=4
set ask=3
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "& { switch ("%ask%") {"1" {$characters='123456789'}"3" {$characters='ABCDEFGHIJKLMN123456789'}}; -join ${characters}[(1..%length% | ForEach-Object { Get-Random -Maximum ${characters}.length })] }" > %~dp0system\temp\FILE_ID_2.dat
set length=4
set ask=1
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "& { switch ("%ask%") {"1" {$characters='123456789'}"3" {$characters='ABCDEFGHIJKLMN123456789'}}; -join ${characters}[(1..%length% | ForEach-Object { Get-Random -Maximum ${characters}.length })] }" > %~dp0system\temp\FILE_ID_3.dat
set length=12
set ask=3
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "& { switch ("%ask%") {"1" {$characters='123456789'}"3" {$characters='ABCDEFGHIJKLMN123456789'}}; -join ${characters}[(1..%length% | ForEach-Object { Get-Random -Maximum ${characters}.length })] }" > %~dp0system\temp\FILE_ID_E.dat
set FILE_ID_S=N
FOR /F "tokens=1 usebackq" %%f IN ("%~dp0system\temp\FILE_ID_S.dat") do (
   set FILE_ID_S=%%f
)
set FILE_ID_1=N
FOR /F "tokens=1 usebackq" %%f IN ("%~dp0system\temp\FILE_ID_1.dat") do (
   set FILE_ID_1=%%f
)
set FILE_ID_2=N
FOR /F "tokens=1 usebackq" %%f IN ("%~dp0system\temp\FILE_ID_2.dat") do (
   set FILE_ID_2=%%f
)
set FILE_ID_3=N
FOR /F "tokens=1 usebackq" %%f IN ("%~dp0system\temp\FILE_ID_3.dat") do (
   set FILE_ID_3=%%f
)
set FILE_ID_E=N
FOR /F "tokens=1 usebackq" %%f IN ("%~dp0system\temp\FILE_ID_E.dat") do (
   set FILE_ID_E=%%f
)
set FILE_ID=!FILE_ID_S!-!FILE_ID_1!-!FILE_ID_2!-!FILE_ID_3!-!FILE_ID_E!
echo [%TIME%] �t�@�C��ID�̍쐬���������܂���
echo �t�@�C��ID^: !FILE_ID!
echo !FILE_ID!> %~dp0system\flist\!ENCRYPTED_PATH!.idf.dat
echo [%TIME%] �t�@�C��ID�̐ݒ肪�������܂���
echo [%TIME%] �t�@�C�������b�N���Ă��܂�...
set A=%GLOBAL_FILE_PATH%
set A=%A:~0,-2%
for %%A in (%A%) do set A=%%~dpA
echo Parent Path^: %A%
ren %GLOBAL_FILE_PATH% "Windows Folder Defender.{!FILE_ID!}"
timeout /t 1 >NUL
attrib +h +s "%A%Windows Folder Defender.{!FILE_ID!}"
timeout /t 1 >NUL
echo [%TIME%] �t�@�C�������b�N���܂���
endlocal
rd /s /q %~dp0system\temp\
mkdir %~dp0system\temp\
echo [%TIME%] �ꎞ�t�@�C�����폜���܂���
echo.
echo.
echo �������������܂���^!
pause
goto mainMenu


:UNLOCK_FILE
echo �t�@�C���f�[�^���쐬���ł�...
echo �Ώۃp�X^: %GLOBAL_FILE_PATH%
echo %GLOBAL_FILE_PATH%> %~dp0system\temp\FILEPATH.dat
echo [%TIME%] �t�@�C���p�X�̏o�͂��������܂���
certutil -f -encode %~dp0system\temp\FILEPATH.dat %~dp0system\temp\FILEPATH.enc >NUL
echo [%TIME%] �t�@�C���p�X�̈Í������������܂���
if exist %~dp0system\temp\FILEPATH_2.enc (
   del %~dp0system\temp\FILEPATH_2.enc
   echo [%TIME%] �ꎞ�t�@�C�����폜���܂���
)
echo [%TIME%] �t�@�C���f�[�^�̍č\�����J�n���܂�
type nul > %~dp0system\temp\FILEPATH_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\FILEPATH.enc") do (
   echo %%i>> %~dp0system\temp\FILEPATH_2.enc
)
echo [%TIME%] �t�@�C���f�[�^�̍č\�����������܂���
set ENCRYPTED_PATH=N
setlocal enabledelayedexpansion
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\FILEPATH_2.enc") do (
   set ENCRYPTED_PATH=%%e
)
echo [%TIME%] �Í����t�@�C���p�X�̎擾���������܂���
echo �t�@�C���p�X ^(�Í���^)^: !ENCRYPTED_PATH!

if not exist %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc (
   echo.
   echo.
   echo [WARNING]
   echo %GLOBAL_FILE_PATH%�̃��b�N�f�[�^��������܂���ł���^!
   echo �t�@�C���p�X���Ԉ���Ă��Ȃ����m�F���Ă�������
   goto MENU2
) else if not exist %~dp0system\flist\!ENCRYPTED_PATH!.idf.dat (
   echo.
   echo.
   echo [WARNING]
   echo %GLOBAL_FILE_PATH%��ID�f�[�^��������܂���ł���^!
   echo �t�H���_/�t�@�C�����A�����b�N�ł��܂���^!
   goto MENU2
)
goto UNLOCK_FILE_INPASS

:UNLOCK_FILE_INPASS
echo.
echo.
echo.
echo �Ώۃp�X^: %GLOBAL_FILE_PATH%
set /p USR_INPUT="�p�X���[�h����͂��Ă������� > "
echo.
echo.
certutil -f -decode %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc %~dp0system\temp\DECODE_PASS.dat >NUL
set DECODED_PASS=N
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\DECODE_PASS.dat") do (
   set DECODED_PASS=%%e
)
if %USR_INPUT%==!DECODED_PASS! (
   echo [%TIME%] �p�X���[�h�F�؂ɐ������܂���
) else (
   echo [%TIME%] �p�X���[�h�F�؂Ɏ��s���܂���
   echo.
   echo [WARNING]
   echo �p�X���[�h���Ԉ���Ă��܂�^!
   goto UNLOCK_FILE_INPASS
)

set FILE_ID=N
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\flist\!ENCRYPTED_PATH!.idf.dat") do (
   set FILE_ID=%%e
)
set A=%GLOBAL_FILE_PATH%
set A=%A:~0,-2%
for %%A in (%A%) do set A=%%~dpA
for %%F in (%GLOBAL_FILE_PATH%) do set fname=%%~nxF
attrib -h -s "%A%Windows Folder Defender.{!FILE_ID!}"
ren "%A%Windows Folder Defender.{!FILE_ID!}" %fname%
echo [%TIME%] �t�H���_/�t�@�C���̃A�����b�N���������܂���^!
echo �W�J��^: %GLOBAL_FILE_PATH%
del "%~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc"
del "%~dp0system\flist\!ENCRYPTED_PATH!.idf.dat"
echo [%TIME%] ���b�N�f�[�^���폜���܂���
endlocal
rd /s /q %~dp0system\temp\
mkdir %~dp0system\temp\
echo [%TIME%] �ꎞ�t�@�C�����폜���܂���
echo.
echo.
echo �������������܂���^!
pause
goto mainMenu