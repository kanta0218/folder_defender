@echo off
set INSTALLED=false
if exist "C:\Program Files\Java" (
    set INSTALLED=true
) else if exist "C:\Program Files (x86)\Java" (
    set INSTALLED=true
)

if %INSTALLED%==false (
    echo Java���C���X�g�[������Ă��܂���^!
    pause >NUL
    exit
)