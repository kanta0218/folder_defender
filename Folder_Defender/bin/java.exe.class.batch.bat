@echo off
goto main

:main
set /p JV_CLASS="Javaファイルのクラス名を入力してください > "
java %JV_CLASS%
echo.
echo.
goto main