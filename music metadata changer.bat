@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p inputart="Enter Input Path Art File: "
cls
set /p title="Enter Title: "
cls
set /p album="Enter Album: "
cls
set /p con_artist="Enter Artist: "
cls
set /p tn="Enter Track Number: "
cls
set /p extra="Enter Extra Parameter: "
cls

ffmpeg -i %input% -i %inputart% -map 0:a -map 1:v -id3v2_version 3 -metadata title="%title%" -metadata album="%album%" -metadata artist="%con_artist%" -metadata:s:v comment="Cover (front)" -metadata track="%tn%" %extra% -b:a 320k %output%

echo Complete!
pause