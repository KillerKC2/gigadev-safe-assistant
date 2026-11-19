@echo off
setlocal
python -m PyInstaller --noconfirm --clean --onefile --windowed --name GigaDevSafeAssistant app.py
if errorlevel 1 exit /b %errorlevel%
echo Built dist\GigaDevSafeAssistant.exe
