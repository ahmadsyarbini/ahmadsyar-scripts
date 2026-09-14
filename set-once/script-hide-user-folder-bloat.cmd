@echo off

rem this is to hide folder that I will never use

cd %userprofile%

attrib +h "%userprofile%\3D Objects"
attrib +h "%userprofile%\Contacts"
attrib +h "%userprofile%\Favorites"
attrib +h "%userprofile%\Links"
attrib +h "%userprofile%\Music"
attrib +h "%userprofile%\My Drive Streaming"
attrib +h "%userprofile%\Recorded Calls"
attrib +h "%userprofile%\Searches"
attrib +h "%userprofile%\Work Drive Streaming"

echo done

timeout /t 2 /nobreak >nul