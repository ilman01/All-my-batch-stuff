@echo off

set /p input="Enter Input Path File: "
cls
set /p input2="Enter Input 2 Path File: "
cls
set /p output="Enter Output Path File: "
cls

@echo on

ffmpeg -i %input% -i %input2% -map 0:v -c:v copy -map 0:a -c:a copy -map 1:s:0 -c:s srt -metadata:s:s:0 language=eng -bsf:v "filter_units=remove_types=6" %output%

echo Complete!
pause