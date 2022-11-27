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

ffmpeg -i %input% -map 0:v -map 0:a -c:a copy -vf "subtitles=subtitle.srt:fontsdir=subfont/select:force_style='Fontsize=16,BorderStyle=4,BackColour=&H80000000&,Outline=0,FontName=PFDinTextPro-Regular'" %output%

del subtitle.srt

echo Complete!
pause