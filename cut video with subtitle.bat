@echo off

set /p input="Enter Input Path File: "
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

ffmpeg -i %input% -ss %start% -to %end% -map 0:v -qp %quality% -c:v h264_nvenc -map 0:a:0 -ac 2 -b:a 320k -c:a libvorbis -filter:a "volume=%gain%dB" -map 0:s:0 -c:s srt -disposition:s:s:0 forced -shortest -metadata:s:s:0 language=eng %output%

echo Complete!
pause