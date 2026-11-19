@echo off
setlocal
python -m PyInstaller --noconfirm --clean --onefile --windowed --name GigaDevAIAgent agent_app.py
if errorlevel 1 exit /b %errorlevel%
echo Built dist\GigaDevAIAgent.exe
