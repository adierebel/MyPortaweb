@echo off
title PHP TEST
echo ##### START PHP TEST SECTION #####
echo:
echo:
echo [PHP]: FIRST TEST - Searching for an installed Microsoft Visual C++ 2015 runtime package in the registry ...
set runtime15_a=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\DevDiv\vc\Servicing\14.0\RuntimeMinimum
set runtime15_b=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DevDiv\vc\Servicing\14.0\RuntimeMinimum
set runtime15_c=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum
reg query "%runtime15_a%" /v Version
if %ERRORLEVEL% EQU 0 (
    goto runtime_success
)
reg query "%runtime15_b%" /v Version
if %ERRORLEVEL% EQU 0 (
    goto runtime_success
)
reg query "%runtime15_c%" /v Version
if %ERRORLEVEL% EQU 0 (
    goto runtime_success
)
  echo:
  echo [WARNING]: Microsoft C++ 2015 runtime libraries not found !!!
  echo [WARNING]: Possibly PHP cannot execute without these runtime libraries
  echo [WARNING]: Please install the MS VC++ 2015 Redistributable Package from the Mircrosoft page
  echo [WARNING]: https://www.microsoft.com/en-us/download/details.aspx?id=48145
  goto runtime_end
:runtime_success
echo [SUCCESS]: Microsoft Visual C++ 2015 Redistributable Package found! Good!
:runtime_end
echo:
echo:
echo [PHP]: SECOND TEST - Execute php.exe with php\php.exe -n -d output_buffering=0 --version ...
echo:
php\php.exe -n -d output_buffering=0 --version
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: Test php.exe failed !!!
  echo [ERROR]: Perhaps the Microsoft C++ 2015 runtime package is not installed.
  echo [ERROR]: Please install the MS VC++ 2015 Redistributable Package from the Mircrosoft page
  echo:
  echo ##### END PHP TEST SECTION #####
  echo:
  pause
  exit 1
)
echo [SUCCESS]: Test for the php.exe successfully passed. Good!
echo:
echo ##### END PHP TEST SECTION #####
echo:
@pause 