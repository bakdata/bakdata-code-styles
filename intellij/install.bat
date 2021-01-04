REM Installs bakdata IntelliJ configs into your user configs.
@echo off
echo Installing bakdata IntelliJ configs...

setlocal enableDelayedExpansion

for /D %%i in ("%APPDATA%"\JetBrains\.AndroidStudio*) do call :copy_config "%%i"
for /D %%i in ("%APPDATA%"\JetBrains\.IdeaIC*) do call :copy_config "%%i"
for /D %%i in ("%APPDATA%"\JetBrains\.IntelliJIdea*) do call :copy_config "%%i"

echo.
echo Restart IntelliJ.
exit /b

REM sub function for copy config files
:copy_config
set config_dir=%~1\config
echo Installing to "!config_dir!"
xcopy /s configs "!config_dir!"
echo Done.
echo.
exit /b