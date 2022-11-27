@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls

@echo on

ffmpeg -i %input% -map 0 -map -0:1 -map -0:3 -map -0:4 -metadata title= -c copy %output%

echo Complete!
pause