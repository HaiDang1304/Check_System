# ===================================
# Script Kiem Tra Thong Tin He Thong
# ===================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   THONG TIN HE THONG MAY TINH" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Lay thong tin he dieu hanh
Write-Host "--- HE DIEU HANH ---" -ForegroundColor Yellow
$os = Get-CimInstance Win32_OperatingSystem
Write-Host "Ten he dieu hanh: " -NoNewline; Write-Host $os.Caption -ForegroundColor Green
Write-Host "Phien ban: " -NoNewline; Write-Host $os.Version -ForegroundColor Green
Write-Host "Build: " -NoNewline; Write-Host $os.BuildNumber -ForegroundColor Green
Write-Host "Kien truc: " -NoNewline; Write-Host $os.OSArchitecture -ForegroundColor Green
Write-Host "Ngon ngu: " -NoNewline; Write-Host $os.OSLanguage -ForegroundColor Green
Write-Host "Cai dat luc: " -NoNewline; Write-Host $os.InstallDate -ForegroundColor Green
Write-Host "Khoi dong lan cuoi: " -NoNewline; Write-Host $os.LastBootUpTime -ForegroundColor Green

# Thoi gian hoat dong
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Host "Thoi gian hoat dong: " -NoNewline
Write-Host "$($uptime.Days) ngay, $($uptime.Hours) gio, $($uptime.Minutes) phut" -ForegroundColor Green

Write-Host ""
Write-Host "--- BO XU LY (CPU) ---" -ForegroundColor Yellow
$cpu = Get-CimInstance Win32_Processor
Write-Host "Ten CPU: " -NoNewline; Write-Host $cpu.Name -ForegroundColor Green
Write-Host "So nhan: " -NoNewline; Write-Host $cpu.NumberOfCores -ForegroundColor Green
Write-Host "So luong: " -NoNewline; Write-Host $cpu.NumberOfLogicalProcessors -ForegroundColor Green
Write-Host "Toc do toi da: " -NoNewline; Write-Host "$($cpu.MaxClockSpeed) MHz" -ForegroundColor Green
Write-Host "Toc do hien tai: " -NoNewline; Write-Host "$($cpu.CurrentClockSpeed) MHz" -ForegroundColor Green

# Bo nho RAM
Write-Host ""
Write-Host "--- BO NHO RAM ---" -ForegroundColor Yellow
$totalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeRAM = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedRAM = [math]::Round($totalRAM - $freeRAM, 2)
$ramPercent = [math]::Round(($usedRAM / $totalRAM) * 100, 2)

Write-Host "Tong RAM: " -NoNewline; Write-Host "$totalRAM GB" -ForegroundColor Green
Write-Host "Da su dung: " -NoNewline; Write-Host "$usedRAM GB ($ramPercent%)" -ForegroundColor Green
Write-Host "Con trong: " -NoNewline; Write-Host "$freeRAM GB" -ForegroundColor Green

# Thong tin o dia
Write-Host ""
Write-Host "--- O DIA ---" -ForegroundColor Yellow
$disks = Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}
foreach ($disk in $disks) {
    $totalSpace = [math]::Round($disk.Size / 1GB, 2)
    $freeSpace = [math]::Round($disk.FreeSpace / 1GB, 2)
    $usedSpace = [math]::Round($totalSpace - $freeSpace, 2)
    $diskPercent = [math]::Round(($usedSpace / $totalSpace) * 100, 2)
    
    Write-Host ""
    Write-Host "O dia $($disk.DeviceID)" -ForegroundColor Cyan
    Write-Host "  Tong dung luong: " -NoNewline; Write-Host "$totalSpace GB" -ForegroundColor Green
    Write-Host "  Da su dung: " -NoNewline; Write-Host "$usedSpace GB ($diskPercent%)" -ForegroundColor Green
    Write-Host "  Con trong: " -NoNewline; Write-Host "$freeSpace GB" -ForegroundColor Green
    Write-Host "  Nhan: " -NoNewline; Write-Host $disk.VolumeName -ForegroundColor Green
    Write-Host "  He thong file: " -NoNewline; Write-Host $disk.FileSystem -ForegroundColor Green
}

# Card man hinh
Write-Host ""
Write-Host "--- CARD MAN HINH ---" -ForegroundColor Yellow
$gpu = Get-CimInstance Win32_VideoController
foreach ($g in $gpu) {
    Write-Host "Ten: " -NoNewline; Write-Host $g.Name -ForegroundColor Green
    if ($g.AdapterRAM) {
        $vram = [math]::Round($g.AdapterRAM / 1GB, 2)
        Write-Host "VRAM: " -NoNewline; Write-Host "$vram GB" -ForegroundColor Green
    }
    Write-Host "Driver: " -NoNewline; Write-Host $g.DriverVersion -ForegroundColor Green
    Write-Host "Do phan giai: " -NoNewline; Write-Host "$($g.CurrentHorizontalResolution) x $($g.CurrentVerticalResolution)" -ForegroundColor Green
}

# Bo mach chu
Write-Host ""
Write-Host "--- BO MACH CHU ---" -ForegroundColor Yellow
$board = Get-CimInstance Win32_BaseBoard
Write-Host "Nha san xuat: " -NoNewline; Write-Host $board.Manufacturer -ForegroundColor Green
Write-Host "Model: " -NoNewline; Write-Host $board.Product -ForegroundColor Green

# May tinh
Write-Host ""
Write-Host "--- THONG TIN MAY TINH ---" -ForegroundColor Yellow
$computer = Get-CimInstance Win32_ComputerSystem
Write-Host "Ten may: " -NoNewline; Write-Host $computer.Name -ForegroundColor Green
Write-Host "Nha san xuat: " -NoNewline; Write-Host $computer.Manufacturer -ForegroundColor Green
Write-Host "Model: " -NoNewline; Write-Host $computer.Model -ForegroundColor Green
Write-Host "Domain: " -NoNewline; Write-Host $computer.Domain -ForegroundColor Green
Write-Host "Nguoi dung: " -NoNewline; Write-Host $computer.UserName -ForegroundColor Green

# Card mang
Write-Host ""
Write-Host "--- CARD MANG ---" -ForegroundColor Yellow
$networks = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true}
foreach ($net in $networks) {
    Write-Host ""
    Write-Host "Card mang: " -NoNewline; Write-Host $net.Description -ForegroundColor Cyan
    Write-Host "  Dia chi IP: " -NoNewline; Write-Host ($net.IPAddress -join ", ") -ForegroundColor Green
    Write-Host "  MAC Address: " -NoNewline; Write-Host $net.MACAddress -ForegroundColor Green
    if ($net.DefaultIPGateway) {
        Write-Host "  Gateway: " -NoNewline; Write-Host ($net.DefaultIPGateway -join ", ") -ForegroundColor Green
    }
}

# BIOS
Write-Host ""
Write-Host "--- BIOS ---" -ForegroundColor Yellow
$bios = Get-CimInstance Win32_BIOS
Write-Host "Nha san xuat: " -NoNewline; Write-Host $bios.Manufacturer -ForegroundColor Green
Write-Host "Phien ban: " -NoNewline; Write-Host $bios.SMBIOSBIOSVersion -ForegroundColor Green
Write-Host "Ngay phat hanh: " -NoNewline; Write-Host $bios.ReleaseDate -ForegroundColor Green

# Trang thai pin (neu la laptop)
Write-Host ""
Write-Host "--- PIN (neu co) ---" -ForegroundColor Yellow
$battery = Get-CimInstance Win32_Battery
if ($battery) {
    Write-Host "Ten: " -NoNewline; Write-Host $battery.Name -ForegroundColor Green
    Write-Host "Trang thai: " -NoNewline; Write-Host $battery.Status -ForegroundColor Green
    Write-Host "Phan tram con lai: " -NoNewline; Write-Host "$($battery.EstimatedChargeRemaining)%" -ForegroundColor Green
} else {
    Write-Host "Khong phat hien pin (May tinh de ban)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       HOAN TAT KIEM TRA" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Tuy chon: Xuat ra file text
Write-Host ""
Write-Host "Ban co muon luu thong tin nay ra file? (Y/N): " -NoNewline -ForegroundColor Magenta
$save = Read-Host
if ($save -eq "Y" -or $save -eq "y") {
    $filename = "system_info_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    
    # Xuat thong tin ra file
    "THONG TIN HE THONG - $(Get-Date)" | Out-File $filename
    "=" * 50 | Out-File $filename -Append
    
    systeminfo | Out-File $filename -Append
    
    Write-Host ""
    Write-Host "Da luu thong tin vao file: " -NoNewline
    Write-Host $filename -ForegroundColor Green
}
