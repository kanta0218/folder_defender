@echo off
setlocal enabledelayedexpansion
set FILE_DD=
for %%f in (%*) do (
  set FILE_DD=%%f
)

if ""!FILE_DD!""=="""" (
    echo Please D^&D a Java file.
    echo Please press any key.
    pause > nul
    exit
)

javac -encoding utf-8 !FILE_DD!
endlocal
pause
exit