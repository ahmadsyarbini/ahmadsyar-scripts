@echo off
Title adobe to mega backupper
rem usage copy paste into adobe folder
rclone cleanup megarepo:
rclone sync "%~dp0." megarepo:/Lib-Adobe --include --ignore-case -P --bwlimit 4M
rem rclone sync "%~dp0." megarepo:/Lib-Adobe --include "Adobe*.iso" --ignore-case -P --bwlimit 4M
rem rclone sync "%~dp0." megarepo:/Lib-Adobe --include "*.md5" --ignore-case -P --bwlimit 4M
rclone cleanup megarepo:
timeout /t 2 >nul