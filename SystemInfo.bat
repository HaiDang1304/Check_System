@echo off
chcp 65001 >nul
title Thong Tin He Thong May Tinh
color 0B

echo ========================================
echo    DANG TAI THONG TIN HE THONG...
echo ========================================
echo.

powershell.exe -ExecutionPolicy Bypass -File "%~dp0system_info.ps1"

echo.
echo ========================================
echo    Nhan phim bat ky de dong cua so...
echo ========================================
pause >nul
