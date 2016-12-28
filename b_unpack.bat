@echo off

SET modified=%CD%\Modified
SET local=%CD%

if not exist "%modified%\" goto:eof

echo.Merging files from %modified%
CALL :dofolder "\Audio\BGM\"
CALL :dofolder "\Audio\BGS\"
CALL :dofolder "\Audio\ME\"
CALL :dofolder "\Audio\SE\"
CALL :dofolder "\Data\"
CALL :dofolder "\Fonts\"
CALL :dofolder "\Graphics\Animations\"
CALL :dofolder "\Graphics\Autotiles\"
CALL :dofolder "\Graphics\Characters\"
CALL :dofolder "\Graphics\Faces\"
CALL :dofolder "\Graphics\Fogs\"
CALL :dofolder "\Graphics\Icons\"
CALL :dofolder "\Graphics\Lightmaps\"
CALL :dofolder "\Graphics\Lights\"
CALL :dofolder "\Graphics\Menus\"
CALL :dofolder "\Graphics\Misc\"
CALL :dofolder "\Graphics\Panoramas\"
CALL :dofolder "\Graphics\Pictures\"
CALL :dofolder "\Graphics\Tilesets\"
CALL :dofolder "\Graphics\Titles\"
CALL :dofolder "\Graphics\Transitions\"
CALL :dofolder "\Graphics\Windowskins\"
CALL :dofolder "\Wallpaper\"
goto:eof

:dofolder
if exist "%modified%%~1" (
	for /f "delims=" %%a in ('dir /a /b "%modified%%~1"') do (CALL :docopy %~1 "%%a")
)
exit /b 0

:docopy
echo.Copying "%modified%%~1%~2"
xcopy /y "%modified%%~1%~2" "%local%%~1" >nul
exit /b 0