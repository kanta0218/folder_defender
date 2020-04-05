@echo off
rem Folder Defender 設定ファイル


rem Folder Defenderの起動モードの設定
rem NORMAL   : 通常モードで起動
rem DEVELOPER: 開発者モードで起動
rem ※開発者モードは動作が不安定になる場合があります
set SETTING_STARTUP_MODE=NORMAL

echo [%TIME%] SETTING_STARTUP_MODE=%SETTING_STARTUP_MODE%

rem パスワードの長さ(最大値:2～無制限)
rem 推奨      : 4文字以上
rem デフォルト: 10文字
set SETTING_PASS_MAX_LENGTH=20

echo [%TIME%] SETTING_PASS_MAX_LENGTH=%SETTING_PASS_MAX_LENGTH%

rem 処理待ち時間(最低時間)の設定 (0～30)
rem デフォルト: 3秒
rem ※短すぎると動作が不安定になる場合があります
set SETTING_PROCESS_WAIT_TIME=3

if %SETTING_PROCESS_WAIT_TIME% gtr 30 (
    echo [ERROR]
    echo SETTING_PROCESS_WAIT_TIME value is not correct!
    echo The value of SETTING_PROCESS_WAIT_TIME must be between 0 and 30!
    echo Value^: %SETTING_PROCESS_WAIT_TIME%
    echo.
    echo Please press any key.
    pause > nul
    exit
)

echo [%TIME%] SETTING_PROCESS_WAIT_TIME=%SETTING_PROCESS_WAIT_TIME%

rem 最大ファイル/フォルダサイズの指定 (Byte)
rem 無制限          : 0
rem 初期設定 (500MB): 524,288,000 bytes
set SETTING_FILE_MAX_SIZE=524288000

echo [%TIME%] SETTING_FILE_MAX_SIZE=%SETTING_FILE_MAX_SIZE%

rem アンインストール用パスコード(UNINSTパスコード)
rem 初期設定: 0000
set SETTING_PASS_UNINST=0000

echo [%TIME%] SETTING_PASS_UNINST=%SETTING_PASS_UNINST%

rem 起動可能OS
rem ALL   : ALL (初期設定) - 推奨
rem WIN7  : Windows 7
rem WIN8  : Windows 8
rem WIN8_1: Windows 8.1
rem WIN10 : Windows 10
set SETTING_COMPLIANT_OS_VER=ALL

echo [%TIME%] SETTING_COMPLIANT_OS_VER=%SETTING_COMPLIANT_OS_VER%