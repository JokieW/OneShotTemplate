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

xcopy "%fullsteam%" "%local%" /q /i /e

ren "steamshim.exe" "Game.exe"

echo.Creating symbolic link
del "%local%\Data\Scripts.rxdata"
mklink /h "%local%\Data\Scripts.rxdata" "%local%\Data\xScripts.rxdata"

@echo 420530> steam_appid.txt

del b_setup.bat