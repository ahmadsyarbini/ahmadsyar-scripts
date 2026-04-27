@echo off
rem usage : put into music folder
rclone cleanup megamy:
rclone sync "%~dp0." "megamy:/lib-music" --ignore-case -P --bwlimit 5M -v
rclone sync "%~dp0./music" "hitomi:/Music/my-music" --ignore-case -P --bwlimit 8M --retries 1 -v --low-level-retries 1
rclone cleanup megamy:
timeout /t 2 >nul