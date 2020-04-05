@echo off
rem Charset: Shift-JIS
rem このファイルはShift-JISで作成されました

rem   スタートアップ処理

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
echo [1] フォルダ/ファイルをロックする
echo [2] フォルダ/ファイルをアンロックする
echo [3] ヘルプ
echo [4] アップデート履歴
echo [5] 終了
echo -----------------------------------------
echo.
set /p USR_MENU="選択してください (1～5) > "

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
echo ロックするフォルダ/ファイルのパスを入力してください ^(絶対パスで入力^)
echo ---------- カレントディレクトリを移動する ----------
echo デスクトップ^: #DESKTOP
set /p USR_PATH="(キャンセルする場合は #CANCEL を入力してください) > "
if "%USR_PATH%"=="#CANCEL" (
   goto mainMenu
) else if "%USR_PATH%"=="#DESKTOP" (
   goto MENU1_Desktop
) else if EXIST "%USR_PATH%" (
   echo しばらくお待ちください...
   set GLOBAL_FILE_PATH=%USR_PATH%
   timeout /t 1 > nul
   goto LOCK_FILE
) else if NOT EXIST "%USR_PATH%" (
   echo.
   echo.
   echo.
   echo [ERROR]
   echo 指定されたフォルダ/ファイル^(%USR_PATH%^)は存在しません^!
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
echo ロックするフォルダ/ファイルのパスを入力してください ^(絶対パスで入力^)
set /p USR_PATH="(キャンセルする場合は #CANCEL を入力してください) > %Userprofile%\Desktop\"
if "%USR_PATH%"==#CANCEL (
   goto mainMenu
)
set USR_PATH="%Userprofile%\Desktop\%USR_PATH%"
if EXIST "%USR_PATH%" (
   echo しばらくお待ちください...
   set GLOBAL_FILE_PATH=%USR_PATH%
   timeout /t 1 > nul
   goto LOCK_FILE
) else if NOT EXIST "%USR_PATH%" (
   echo.
   echo.
   echo.
   echo [ERROR]
   echo 指定されたフォルダ/ファイル^(%USR_PATH%^)は存在しません^!
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
echo アンロックするフォルダ/ファイルのパスを入力してください
echo ※ロック時に登録したパスを入力してください^!
echo ---------- カレントディレクトリを移動する ----------
echo デスクトップ^: #DESKTOP
set /p USR_PATH="(キャンセルする場合は #CANCEL を入力してください) > "
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
echo アンロックするフォルダ/ファイルのパスを入力してください
echo ※ロック時に登録したパスを入力してください^!
set /p USR_PATH="(キャンセルする場合は #CANCEL を入力してください) > %Userprofile%\Desktop\"
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
echo [0] 戻る
echo [1] 使い方ガイド
echo [2] オフラインヘルプ
echo -----------------------------------------
echo.
set /p USR_HELPMENU="選択してください (0～2) > "

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
echo -------------------- アップデート履歴 --------------------
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

set /p USR_CONFIRM="このフォルダ/ファイルをロックしますか? (y/n) > "

if %USR_CONFIRM%==y (
   echo しばらくお待ちください...
   set GLOBAL_FILE_PATH=!FILE_DD!
   timeout /t 1 > nul
   goto LOCK_FILE
) else %USR_CONFIRM%==n (
   echo 処理を中断しました^!
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
echo 指定したフォルダ/ファイルパスに空白文字やダブルクォーテション^(^"^)が含まれていないか確認してください^!
echo 上記の文字が含まれていると正常にロックできません^!
echo.
echo ^> 処理を続行する場合はEnterキーを押してください ^<
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
   echo ファイルパスに使用できない文字が使われています^!
   echo.
   echo Please press any key.
   pause > NUL
   goto mainMenu
)
endlocal


if not exist %GLOBAL_FILE_PATH% (
   echo [WARNING]
   echo エラーレベル^: 2
   echo ファイルパスの取得に失敗しました^!
   goto MENU1
)

set /p USR_PASS="任意のパスワードを入力してください (最大: %SETTING_PASS_MAX_LENGTH%文字) > "

if ""%USR_PASS%""=="""" (
   echo.
   echo [ERROR]
   echo パスワードを入力してください^!
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
   echo パスワードに使用できない文字が使用されています^!
   echo パスワードに : ^! 等の特殊文字を含めることはできません^!
   goto LOCK_FILE
)

echo %USR_PASS% > %~dp0system\TEMP_PASS.dat
for %%i in (%~dp0system\TEMP_PASS.dat) do set /a SIZE=%%~zi-3
timeout /t 1 >NUL
echo .> %~dp0system\TEMP_PASS.dat
if %SIZE% gtr %SETTING_PASS_MAX_LENGTH% (
   echo.
   echo [ERROR]
   echo パスワードが長すぎます^! ^(最大: %SETTING_PASS_MAX_LENGTH%^)
   echo 最大値を変更する場合は、setting.batを直接書き換えてください
   goto LOCK_FILE
) else (
   goto LOCK_FILE_PROCESS
)

:CANT_LOCK_1
echo.
echo.
echo.
echo [ERROR]
echo 指定されたフォルダ/ファイルはFDシステムファイルです^!
echo FDシステムファイルはロックできません^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_2
echo.
echo.
echo.
echo [ERROR]
echo 指定されたフォルダ/ファイルにFolder Defenderが含まれているためロックできません^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_3
echo.
echo.
echo.
echo [ERROR]
echo ドライブをロックする事はできません^!
echo ドライブ内のフォルダ/ファイルを指定してください^!
echo.
echo.
echo.
goto MENU1


:CANT_LOCK_4
echo.
echo.
echo.
echo [ERROR]
echo 半角スペース/全角スペースが含まれているファイルをロックする事はできません^!
echo フォルダ/ファイル名を変更してください^!
echo.
echo.
echo.
goto MENU1


:LOCK_FILE_PROCESS
echo.
echo.
echo.
echo ファイルデータを作成中です...
echo 対象パス^: %GLOBAL_FILE_PATH%
echo %GLOBAL_FILE_PATH%> %~dp0system\temp\FILEPATH.dat
echo [%TIME%] ファイルパスの出力が完了しました
certutil -f -encode %~dp0system\temp\FILEPATH.dat %~dp0system\temp\FILEPATH.enc >NUL
echo [%TIME%] ファイルパスの暗号化が完了しました
if exist %~dp0system\temp\FILEPATH_2.enc (
   del %~dp0system\temp\FILEPATH_2.enc
   echo [%TIME%] 一時ファイルを削除しました
)
echo [%TIME%] ファイルデータの再構成を開始します
type nul > %~dp0system\temp\FILEPATH_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\FILEPATH.enc") do (
   echo %%i>> %~dp0system\temp\FILEPATH_2.enc
)
echo [%TIME%] ファイルデータの再構成が完了しました
echo [%TIME%] ロックデータの作成を開始します
set ENCRYPTED_PATH=N
setlocal enabledelayedexpansion
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\FILEPATH_2.enc") do (
   set ENCRYPTED_PATH=%%e
)
type nul > %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc
echo パスワード^: %USR_PASS%
echo %USR_PASS%> %~dp0system\temp\USERPASS.dat
echo [%TIME%] パスワードの出力が完了しました
certutil -f -encode %~dp0system\temp\USERPASS.dat %~dp0system\temp\USERPASS.enc >NUL
echo [%TIME%] パスワードの暗号化が完了しました
if exist %~dp0system\temp\USERPASS_2.enc (
   del %~dp0system\temp\USERPASS_2.enc
   echo [%TIME%] 一時ファイルを削除しました
)
echo [%TIME%] パスワードデータの再構成しています...
type nul > %~dp0system\temp\USERPASS_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\USERPASS.enc") do (
   echo %%i>> %~dp0system\temp\USERPASS_2.enc
)
echo [%TIME%] パスワードデータの再構成が完了しました
set ENCRYPTED_PASS=N
FOR /F "tokens=1 usebackq" %%p IN ("%~dp0system\temp\USERPASS_2.enc") do (
   set ENCRYPTED_PASS=%%p
)
echo !ENCRYPTED_PASS!> %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc
echo [%TIME%] パスワードの設定が完了しました
echo [%TIME%] ファイルIDを作成しています...
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
echo [%TIME%] ファイルIDの作成が完了しました
echo ファイルID^: !FILE_ID!
echo !FILE_ID!> %~dp0system\flist\!ENCRYPTED_PATH!.idf.dat
echo [%TIME%] ファイルIDの設定が完了しました
echo [%TIME%] ファイルをロックしています...
set A=%GLOBAL_FILE_PATH%
set A=%A:~0,-2%
for %%A in (%A%) do set A=%%~dpA
echo Parent Path^: %A%
ren %GLOBAL_FILE_PATH% "Windows Folder Defender.{!FILE_ID!}"
timeout /t 1 >NUL
attrib +h +s "%A%Windows Folder Defender.{!FILE_ID!}"
timeout /t 1 >NUL
echo [%TIME%] ファイルをロックしました
endlocal
rd /s /q %~dp0system\temp\
mkdir %~dp0system\temp\
echo [%TIME%] 一時ファイルを削除しました
echo.
echo.
echo 処理が完了しました^!
pause
goto mainMenu


:UNLOCK_FILE
echo ファイルデータを作成中です...
echo 対象パス^: %GLOBAL_FILE_PATH%
echo %GLOBAL_FILE_PATH%> %~dp0system\temp\FILEPATH.dat
echo [%TIME%] ファイルパスの出力が完了しました
certutil -f -encode %~dp0system\temp\FILEPATH.dat %~dp0system\temp\FILEPATH.enc >NUL
echo [%TIME%] ファイルパスの暗号化が完了しました
if exist %~dp0system\temp\FILEPATH_2.enc (
   del %~dp0system\temp\FILEPATH_2.enc
   echo [%TIME%] 一時ファイルを削除しました
)
echo [%TIME%] ファイルデータの再構成を開始します
type nul > %~dp0system\temp\FILEPATH_2.enc
FOR /F "eol=- tokens=1 usebackq" %%i IN ("%~dp0system\temp\FILEPATH.enc") do (
   echo %%i>> %~dp0system\temp\FILEPATH_2.enc
)
echo [%TIME%] ファイルデータの再構成が完了しました
set ENCRYPTED_PATH=N
setlocal enabledelayedexpansion
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\FILEPATH_2.enc") do (
   set ENCRYPTED_PATH=%%e
)
echo [%TIME%] 暗号化ファイルパスの取得が完了しました
echo ファイルパス ^(暗号化^)^: !ENCRYPTED_PATH!

if not exist %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc (
   echo.
   echo.
   echo [WARNING]
   echo %GLOBAL_FILE_PATH%のロックデータが見つかりませんでした^!
   echo ファイルパスが間違っていないか確認してください
   goto MENU2
) else if not exist %~dp0system\flist\!ENCRYPTED_PATH!.idf.dat (
   echo.
   echo.
   echo [WARNING]
   echo %GLOBAL_FILE_PATH%のIDデータが見つかりませんでした^!
   echo フォルダ/ファイルをアンロックできません^!
   goto MENU2
)
goto UNLOCK_FILE_INPASS

:UNLOCK_FILE_INPASS
echo.
echo.
echo.
echo 対象パス^: %GLOBAL_FILE_PATH%
set /p USR_INPUT="パスワードを入力してください > "
echo.
echo.
certutil -f -decode %~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc %~dp0system\temp\DECODE_PASS.dat >NUL
set DECODED_PASS=N
FOR /F "tokens=1 usebackq" %%e IN ("%~dp0system\temp\DECODE_PASS.dat") do (
   set DECODED_PASS=%%e
)
if %USR_INPUT%==!DECODED_PASS! (
   echo [%TIME%] パスワード認証に成功しました
) else (
   echo [%TIME%] パスワード認証に失敗しました
   echo.
   echo [WARNING]
   echo パスワードが間違っています^!
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
echo [%TIME%] フォルダ/ファイルのアンロックが完了しました^!
echo 展開先^: %GLOBAL_FILE_PATH%
del "%~dp0system\flist\!ENCRYPTED_PATH!.ldf.enc"
del "%~dp0system\flist\!ENCRYPTED_PATH!.idf.dat"
echo [%TIME%] ロックデータを削除しました
endlocal
rd /s /q %~dp0system\temp\
mkdir %~dp0system\temp\
echo [%TIME%] 一時ファイルを削除しました
echo.
echo.
echo 処理が完了しました^!
pause
goto mainMenu