@echo off
rem usage : put into music folder
rclone cleanup megamy:
rclone sync "%~dp0." "megamy:/lib-music" --ignore-case -P --bwlimit 5M -v --delete-during
rclone sync "%~dp0./music" "hitomi:/Music/my-music" --ignore-case -P --bwlimit 15M --retries 1 -v --low-level-retries 1 --delete-during
rclone cleanup megamy:
timeout /t 2 >nul