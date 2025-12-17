# Script tao file EXE tu PowerShell script
# Can cai dat ps2exe truoc khi chay script nay

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   TAO FILE EXE TU POWERSHELL SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Kiem tra xem ps2exe da duoc cai dat chua
$ps2exeInstalled = Get-Command Invoke-ps2exe -ErrorAction SilentlyContinue

if (-not $ps2exeInstalled) {
    Write-Host "Chua cai dat ps2exe. Dang cai dat..." -ForegroundColor Yellow
    Write-Host ""
    
    try {
        Install-Module -Name ps2exe -Scope CurrentUser -Force -AllowClobber
        Write-Host "Da cai dat ps2exe thanh cong!" -ForegroundColor Green
        Write-Host ""
    }
    catch {
        Write-Host "Loi khi cai dat ps2exe!" -ForegroundColor Red
        Write-Host "Hay chay lenh sau trong PowerShell voi quyen Administrator:" -ForegroundColor Yellow
        Write-Host "Install-Module -Name ps2exe -Scope CurrentUser -Force" -ForegroundColor White
        Write-Host ""
        pause
        exit
    }
}

# Tao file EXE
Write-Host "Dang tao file EXE..." -ForegroundColor Yellow
Write-Host ""

$scriptPath = "$PSScriptRoot\system_info.ps1"
$exePath = "$PSScriptRoot\SystemInfo.exe"

try {
    Invoke-ps2exe -inputFile $scriptPath -outputFile $exePath -noConsole:$false -requireAdmin -iconFile $null
    
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   DA TAO FILE EXE THANH CONG!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "File EXE: " -NoNewline
    Write-Host $exePath -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Ban co the chay file SystemInfo.exe de xem thong tin he thong" -ForegroundColor Yellow
}
catch {
    Write-Host "Loi khi tao file EXE!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host ""
Write-Host "Nhan phim bat ky de dong..." -ForegroundColor Gray
pause
