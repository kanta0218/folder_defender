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
echo Folder Defender���A���C���X�g�[�����܂���?
echo [1] �A���C���X�g�[������
echo [2] �L�����Z��
echo.
set /p USR_CONFIRM="�I�����Ă������� (1�`2) > "

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
set /p USR_PASS="UNINST�p�X�R�[�h����͂��Ă������� ^(�����ݒ�: 0000^) > "

if %USR_PASS%==%SETTING_PASS_UNINST% (
    goto uninstConfirm
) else (
    echo.
    echo �p�X�R�[�h���Ⴂ�܂�^!
    goto uninstPASS
)


:uninstConfirm
echo.
echo.
echo.
echo [Confirm]
echo ==============================  ���ӎ���  ==============================
echo �E�A���C���X�g�[������O�Ƀt�H���_/�t�@�C����S�ăA�����b�N���Ă��������B
echo �E�A���C���X�g�[����̓f�[�^�̕������ł��܂���B
echo ========================================================================
echo.
echo ^! ���ӎ�����K�����m�F�������� ^!
echo.
echo �{���ɃA���C���X�g�[�����܂���? ^(�ŏI�m�F^)
echo.
echo [0] �L�����Z��
echo [1] �A���C���X�g�[������
set /p lastCnf="�I�����Ă������� (0�`1) > "

if %lastCnf%==0 (
   echo.
   echo.
   echo.
   echo �L�����Z�����܂���^!
   timeout /t 2 >nul
   exit
) else if %lastCnf%==1 (
   echo.
   echo.
   echo.
   echo ^>^>^> �A���C���X�g�[�����J�n���܂� ^<^<^<
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
   echo uninstall.bat�ȊO�̑S�Ẵt�H���_/�t�@�C�����폜����܂���
   echo �L�[�������Ɩ{�v���O�����t�@�C�����폜����܂�
   echo.
   pause
   del /f %~dp0%~nx0
   echo.
   echo.
   echo. �S�Ẵf�[�^���폜����܂���^!
   echo. Folder Defender�̃A���C���X�g�[�����������܂���^!
   echo.
   echo.
   echo �����p���肪�Ƃ��������܂���
   echo Thank you for using the Folder Defender.
   echo.
   pause
   exit
) else (
   goto uninstConfirm
)
pause