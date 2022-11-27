@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p scale="Enter Scale: "
cls

ffmpeg -i %input% -filter_complex "scale=%scale%:-2:flags=lanczos,split[v1][v2]; [v1]palettegen=stats_mode=full [palette];[v2][palette]paletteuse=dither=sierra2_4a" %output%

echo Complete!
pause