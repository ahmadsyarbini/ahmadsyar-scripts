@echo off

rem README : shows list of winget updates

winget list --upgrade-available --source=winget --include-unknown && pause