@echo off
rem usage : put into music folder
rem biasanya username password admin admin
rclone cleanup megamy:
rclone sync "%~dp0." "megamy:/lib-music" --ignore-case -P --bwlimit 5M -v --delete-after
rclone sync "%~dp0./music" "pokari:/Music/my-music" --ignore-case -P --retries 1 -v --low-level-retries 1 --delete-after --inplace
rclone cleanup megamy:
timeout /t 2 >nul