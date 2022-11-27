@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p quality="Enter QP: "
cls
set /p gain="Enter Gain: "
cls

@echo on

ffmpeg -i %input% -map 0:s:0 subtitle.srt

ffmpeg -i %input% -map 0:v -map 0:a -b:a 320k -ac 2 -filter:a "volume=%gain%dB" -vf "subtitles=subtitle.srt:force_style='Fontsize=20,BorderStyle=4,BackColour=&H80000000&,Outline=0,FontName=Bahnschrift Light'" %output%

del subtitle.srt

echo Complete!
pause