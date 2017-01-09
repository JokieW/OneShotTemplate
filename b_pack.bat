@echo off

rem If the steam autodiscovery fails, replace "" with your path to steam (make sure it's the one that contains OneShot if you have multiple)
rem ex: SET steam=C:\Program Files (x86)\Steam
rem or: SET steam=G:\SteamLibrary
SET steam=

if "%steam%"=="" ( 
	for /f "tokens=1,2*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Valve\Steam"') do (
		if %%a==SteamPath (
			SET steam=%%c
			goto:steamnamefound
		)
	)
	echo.No steam folder found
	goto:eof
)

:steamnamefound
SET fullsteam=%steam%\steamapps\common\OneShot
if not exist "%fullsteam%\" (
	echo.No oneshot folder in that steam library
	goto:eof
)

SET modified=%CD%\Modified
SET local=%CD%

echo.Scanning "%local%" for differences with "%fullsteam%"

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
FC /B "%local%%~1%~2" "%fullsteam%%~1%~2" 1>nul 2>nul
if %errorlevel% == 0 ( exit /b 0 )
if "%~2"=="Scripts.rxdata" ( exit /b 0 )
echo.Copying "%local%%~1%~2"
if not exist "%modified%%~1" mkdir %modified%%~1
xcopy /y "%local%%~1%~2" "%modified%%~1" >nul
exit /b 0