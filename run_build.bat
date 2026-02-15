@echo off
cd /d "%~dp0"
echo Starting build_runner... > build_log.txt
dart run build_runner build --delete-conflicting-outputs >> build_log.txt 2>&1
echo Done. >> build_log.txt
