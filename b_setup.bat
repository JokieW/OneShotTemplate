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

SET local=%CD%

if exist "%local%\Original\" rd /s /q "%local%\Original\"

mkdir "%local%\Original\"
xcopy "%fullsteam%\Audio" "%local%\Original\Audio" /q /i /e
xcopy "%fullsteam%\Data" "%local%\Original\Data" /q /i /e
xcopy "%fullsteam%\Fonts" "%local%\Original\Fonts" /q /i /e
xcopy "%fullsteam%\Graphics" "%local%\Original\Graphics" /q /i /e
xcopy "%fullsteam%\Wallpaper" "%local%\Original\Wallpaper" /q /i /e

echo.Creating symbolic links
mklink /j "%local%\Audio" "%fullsteam%\Audio"
mklink /j "%local%\Data" "%fullsteam%\Data"
mklink /j "%local%\Fonts" "%fullsteam%\Fonts"
mklink /j "%local%\Graphics" "%fullsteam%\Graphics"
mklink /j "%local%\Wallpaper" "%fullsteam%\Wallpaper"
mklink /h "%fullsteam%\Data\xScripts.rxdata" "%fullsteam%\Data\Scripts.rxdata"