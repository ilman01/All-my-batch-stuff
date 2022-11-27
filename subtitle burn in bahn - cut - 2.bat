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

ffmpeg -i %input2% -map 0:s:0 subtitle.srt

ffmpeg -i %input% -ss %start% -to %end% -map 0:v -map 0:a -b:a 320k -ac 2 -qp %quality% -filter:a "volume=%gain%dB" -vf "subtitles=subtitle.srt:force_style='Fontsize=20,BorderStyle=4,BackColour=&H80000000&,Outline=0,FontName=Bahnschrift Light'" %output%

pause

del subtitle.srt

echo Complete!
pause