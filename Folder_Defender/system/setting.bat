@echo off
rem Folder Defender �ݒ�t�@�C��


rem Folder Defender�̋N�����[�h�̐ݒ�
rem NORMAL   : �ʏ탂�[�h�ŋN��
rem DEVELOPER: �J���҃��[�h�ŋN��
rem ���J���҃��[�h�͓��삪�s����ɂȂ�ꍇ������܂�
set SETTING_STARTUP_MODE=NORMAL

echo [%TIME%] SETTING_STARTUP_MODE=%SETTING_STARTUP_MODE%

rem �p�X���[�h�̒���(�ő�l:2�`������)
rem ����      : 4�����ȏ�
rem �f�t�H���g: 10����
set SETTING_PASS_MAX_LENGTH=20

echo [%TIME%] SETTING_PASS_MAX_LENGTH=%SETTING_PASS_MAX_LENGTH%

rem �����҂�����(�Œ᎞��)�̐ݒ� (0�`30)
rem �f�t�H���g: 3�b
rem ���Z������Ɠ��삪�s����ɂȂ�ꍇ������܂�
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

rem �ő�t�@�C��/�t�H���_�T�C�Y�̎w�� (Byte)
rem ������          : 0
rem �����ݒ� (500MB): 524,288,000 bytes
set SETTING_FILE_MAX_SIZE=524288000

echo [%TIME%] SETTING_FILE_MAX_SIZE=%SETTING_FILE_MAX_SIZE%

rem �A���C���X�g�[���p�p�X�R�[�h(UNINST�p�X�R�[�h)
rem �����ݒ�: 0000
set SETTING_PASS_UNINST=0000

echo [%TIME%] SETTING_PASS_UNINST=%SETTING_PASS_UNINST%

rem �N���\OS
rem ALL   : ALL (�����ݒ�) - ����
rem WIN7  : Windows 7
rem WIN8  : Windows 8
rem WIN8_1: Windows 8.1
rem WIN10 : Windows 10
set SETTING_COMPLIANT_OS_VER=ALL

echo [%TIME%] SETTING_COMPLIANT_OS_VER=%SETTING_COMPLIANT_OS_VER%