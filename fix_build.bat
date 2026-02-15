@echo off
echo ==========================================
echo      PLAN MY DAY - TROUBLESHOOTER
echo ==========================================

echo [1/4] Killing lingering Dart processes...
taskkill /F /IM dart.exe /T >nul 2>&1
if %errorlevel% neq 0 echo No dart processes found (this is good).

echo [2/4] Cleaning project...
call flutter clean

echo [3/4] Getting dependencies...
call flutter pub get

echo [4/4] Generating Database Code...
call dart run build_runner build --delete-conflicting-outputs

echo ==========================================
echo      READY TO RUN
echo ==========================================
echo Try running: flutter run
pause
