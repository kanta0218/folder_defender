@echo off
echo ============================================================
echo                Folder Defender for Windows OS
echo                         Uninstaller
echo ============================================================
timeout /t 2 > nul
call system\setting.bat
echo.
echo.
echo.
goto uninstM

:uninstM
echo.
echo.
echo.
echo Folder Defenderをアンインストールしますか?
echo [1] アンインストールする
echo [2] キャンセル
echo.
set /p USR_CONFIRM="選択してください (1～2) > "

if %USR_CONFIRM%==1 (
   goto uninstPASS
) else if %USR_CONFIRM%==2 (
   exit
) else (
   goto uninstM
)


:uninstPASS
echo.
echo.
echo.
echo ------------------------------------------------------------------
set /p USR_PASS="UNINSTパスコードを入力してください ^(初期設定: 0000^) > "

if %USR_PASS%==%SETTING_PASS_UNINST% (
    goto uninstConfirm
) else (
    echo.
    echo パスコードが違います^!
    goto uninstPASS
)


:uninstConfirm
echo.
echo.
echo.
echo [Confirm]
echo ==============================  注意事項  ==============================
echo ・アンインストールする前にフォルダ/ファイルを全てアンロックしてください。
echo ・アンインストール後はデータの復旧ができません。
echo ========================================================================
echo.
echo ^! 注意事項を必ずご確認ください ^!
echo.
echo 本当にアンインストールしますか? ^(最終確認^)
echo.
echo [0] キャンセル
echo [1] アンインストールする
set /p lastCnf="選択してください (0～1) > "

if %lastCnf%==0 (
   echo.
   echo.
   echo.
   echo キャンセルしました^!
   timeout /t 2 >nul
   exit
) else if %lastCnf%==1 (
   echo.
   echo.
   echo.
   echo ^>^>^> アンインストールを開始します ^<^<^<
   timeout /t 2 >nul
   echo.
   echo.
   echo.
   echo [%TIME%] Deleting some folders and files now...
   rd /s /q %~dp0build\
   rd /s /q %~dp0help\
   rd /s /q %~dp0system\
   rd /s /q %~dp0update\
   echo [%TIME%] Deleted some folders and files.
   echo [%TIME%] Start deleting Folder_Defender.bat.
   del /f %~dp0Folder_Defender.bat
   echo [%TIME%] Deleted the Folder_Defender.bat.
   echo [%TIME%] The deletion process has been completed.
   echo.
   echo.
   echo.
   echo uninstall.bat以外の全てのフォルダ/ファイルが削除されました
   echo キーを押すと本プログラムファイルが削除されます
   echo.
   pause
   del /f %~dp0%~nx0
   echo.
   echo.
   echo. 全てのデータが削除されました^!
   echo. Folder Defenderのアンインストールが完了しました^!
   echo.
   echo.
   echo ご利用ありがとうございました
   echo Thank you for using the Folder Defender.
   echo.
   pause
   exit
) else (
   goto uninstConfirm
)
pause