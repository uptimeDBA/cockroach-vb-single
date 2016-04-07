@ECHO OFF

REM Put the VirtualBox directory in the PATH so we can find it's executables.
REM
setlocal
set PATH=%PATH%;"C:\Program Files\Oracle\VirtualBox"


REM  Power off and remove the machine

VboxManage controlvm    "CockroachDB" poweroff
VboxManage unregistervm "CockroachDB" --delete


pause

exit
