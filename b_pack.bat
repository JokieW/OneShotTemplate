@echo off

SET original=%CD%\Original
SET modified=%CD%\Modified
SET local=%CD%

echo.Scanning "%local%" for differences with "%original%"

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
if exist "%modified%%~1" del /q "%modified%%~1"*
for /f "delims=" %%a in ('dir /a /b "%local%%~1"') do (CALL :compare %~1 "%%a")
exit /b 0

:compare
FC /B "%local%%~1%~2" "%original%%~1%~2" 1>nul 2>nul
if %errorlevel% == 0 ( exit /b 0 )
echo.Copying "%local%%~1%~2"
if not exist "%modified%%~1" mkdir %modified%%~1
xcopy /y "%local%%~1%~2" "%modified%%~1" >nul
exit /b 0