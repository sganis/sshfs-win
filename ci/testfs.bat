:: Golddrive
:: 02/20/2020, San
@echo off
setlocal
setlocal EnableDelayedExpansion

:: this script directory
set DIR=%~dp0
set DIR=%DIR:~0,-1%

echo > test
%DIR%\fsx.exe -N 5000 test xxxxxx
del test test.*
if !ERRORLEVEL! neq 0 goto fail

%DIR%\fsbench-x64.exe -rdwr_cc_* -mmap_* 
:: -file_attr* -file_list_single* -file_list_none* -rdwr_nc_*
if !ERRORLEVEL! neq 0 goto fail

echo PASSED
exit /b 0

:fail
echo FAILED
exit /b 1
