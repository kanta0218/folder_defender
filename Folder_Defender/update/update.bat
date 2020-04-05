@echo off
echo [Folder Defender for Windows OS] Update Checker
echo.
echo ================================================
echo Download the version file.
echo Download Directory: %~dp0
bitsadmin /TRANSFER DL_VER_FILE http://kirito16.ihostfull.com/server/applications/Folder_Defender/latest.version.txt %~dp0latest.version.txt
echo Check the version.
pause