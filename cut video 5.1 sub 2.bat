@echo off

set /p input="Enter Input Path File: "
cls
set /p input2="Enter Input 2 Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p start="Enter Start Time Stamp: "
cls
set /p end="Enter End Time Stamp: "
cls
set /p quality="Enter QP: "
cls
set /p gain="Enter Gain: "
cls

@echo on

ffmpeg -i %input% -i %input2% -ss %start% -to %end% -map 0:v -map 0:a:0 -map 1:s -c:v libx264 -c:a ac3 -c:s mov_text -b:a 512k -qp %quality% -filter:a "volume=%gain%dB" %output%

echo Complete!
pause