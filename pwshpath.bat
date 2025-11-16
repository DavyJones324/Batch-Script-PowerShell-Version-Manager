@echo off
Title PowerShell
SetLocal EnableDelayedExpansion
:startPowerShellShortcutRedirectManager
if "%1"=="6" (
    call :startPowerShellMainPrompt6
) else (
    call :startPowerShellMainPrompt7
)
:checkAdmin
net session > nul 2>&1
if %errorlevel% == 0 (
    goto menuAdminOptions
) else (
    goto menuOptions
)
:startPowerShellMainPrompt6
@set path=C:\CLI_Tools\PowerShell\6;%path%
echo Current version of PowerShell is:
pwsh -v
echo.
echo Options: createdump, pwsh
echo.
goto :eof
:startPowerShellMainPrompt7
@set path=C:\CLI_Tools\PowerShell\7;%path%
echo Current version of Python is:
pwsh -v
echo.
echo Options: createdump, pwsh
echo.
goto :eof
:menuAdminOptions
Set input=0
echo Press [ENTER] to activate COMSPEC, or enter the version number you want to start with (Requires manual restart).
echo.
echo Version Options: 6, 7
set /P input=%BS%
if /I %input% EQU 0 goto startComspec
if /I %input% EQU 6 call :checkAdminPowerShellPath6
if /I %input% EQU 7 call :checkAdminPowerShellPath7
if /I %input% EQU abo goto startAbout
if /I %input% EQU abou goto startAbout
if /I %input% EQU about goto startAbout
if /I %input% EQU cls cls&goto startPowerShellShortcutRedirectManager
if /I %input% EQU exi goto exitBatchProgram
if /I %input% EQU exit goto exitBatchProgram
echo.
echo Invalid selection. Please try again.
echo.
goto menuAdminOptions
:checkAdminPowerShellPath6
echo.
if exist C:\CLI_Tools\PowerShell\6\pwsh.exe (
    goto setPowerShellShortcutAdminReplacement6
) else (
    echo The selected PowerShell version does not exist.
)
goto :eof
:setPowerShellShortcutAdminReplacement6
set "PWSH_SCRIPT_PATH=C:\CLI_Tools\PowerShell\pwshpath.bat
set "PWSH_SHORTCUT_NAME=PowerShell.lnk"
set "PWSH_SHORTCUT_PATH=C:\Users\%USERNAME%\Desktop\PowerShell.lnk"
powershell -Command ^
$WshShell = New-Object -ComObject WScript.Shell; ^
$Shortcut = $WshShell.CreateShortcut('C:\Users\%USERNAME%\Desktop\PowerShell.lnk'); ^
$Shortcut.TargetPath = 'CLI_Tools\Python\pwshpath.bat'; ^
$Shortcut.Arguments = '6'; ^
$Shortcut.WorkingDirectory = '%~dp0'; ^
$Shortcut.Save(); ^
set "PWSH_INSTALL_PATH=C:\CLI_Tools\PowerShell\6
set "OLDPATH=%PATH%"
path "%PWSH_INSTALL_PATH%;%PATH%"
path "%OLDPATH%"
call :startPowerShellMainPrompt6
echo The script will now exit.
echo.
pause
goto exitBatchProgram
:checkAdminPowerShellPath7
echo.
if exist C:\CLI_Tools\PowerShell\7\pwsh.exe (
    goto setPowerShellShortcutAdminReplacement7
) else (
    echo The selected PowerShell version does not exist.
)
goto :eof
:setPowerShellShortcutAdminReplacement7
set "PWSH_SCRIPT_PATH=C:\CLI_Tools\PowerShell\pwshpath.bat
set "PWSH_SHORTCUT_NAME=PowerShell.lnk"
set "PWSH_SHORTCUT_PATH=C:\Users\%USERNAME%\Desktop\PowerShell.lnk"
powershell -Command ^
$WshShell = New-Object -ComObject WScript.Shell; ^
$Shortcut = $WshShell.CreateShortcut('C:\Users\%USERNAME%\Desktop\PowerShell.lnk'); ^
$Shortcut.TargetPath = 'CLI_Tools\Python\pwshpath.bat'; ^
$Shortcut.Arguments = ''; ^
$Shortcut.WorkingDirectory = '%~dp0'; ^
$Shortcut.Save(); ^
set "PWSH_INSTALL_PATH=C:\CLI_Tools\PowerShell\7
set "OLDPATH=%PATH%"
path "%PWSH_INSTALL_PATH%;%PATH%"
path "%OLDPATH%"
call :startPowerShellMainPrompt7
echo The script will now exit.
echo.
pause
goto exitBatchProgram
:menuOptions
Set input=0
echo Press [ENTER] to activate COMSPEC, or enter the version number you want to start with (Requires manual restart).
echo.
echo Version Options: 6, 7
set /P input=%BS%
if /I %input% EQU 0 goto startComspec
if /I %input% EQU 6 call :checkPowerShellPath6
if /I %input% EQU 7 call :checkPowerShellPath7
if /I %input% EQU abo goto startAbout
if /I %input% EQU abou goto startAbout
if /I %input% EQU about goto startAbout
if /I %input% EQU cls cls&goto startPowerShellShortcutRedirectManager
if /I %input% EQU exi goto exitBatchProgram
if /I %input% EQU exit goto exitBatchProgram
echo.
echo Invalid selection. Please try again.
echo.
goto menuOptions
:checkPowerShellPath6
echo.
if exist C:\CLI_Tools\PowerShell\6\pwsh.exe (
    goto setPowerShellShortcutReplacement6
) else (
    echo The selected PowerShell version does not exist.
)
goto :eof
:setPowerShellShortcutReplacement6
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\%USERNAME%\Desktop\PowerShell.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\CLI_Tools\PowerShell\pwshpath.bat" >> %SCRIPT%
echo oLink.Arguments = "6" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
set "PWSH_INSTALL_PATH=C:\CLI_Tools\PowerShell\6
set "OLDPATH=%PATH%"
path "%PWSH_INSTALL_PATH%;%PATH%"
path "%OLDPATH%"
call :startPowerShellMainPrompt6
echo The script will now exit.
echo.
pause
goto exitBatchProgram
:checkPowerShellPath7
echo.
if exist C:\CLI_Tools\PowerShell\7\pwsh.exe (
    goto setPowerShellShortcutReplacement7
) else (
    echo The selected PowerShell version does not exist.
)
goto :eof
:setPowerShellShortcutReplacement7
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\%USERNAME%\Desktop\PowerShell.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\CLI_Tools\PowerShell\pwshpath.bat" >> %SCRIPT%
echo oLink.Arguments = "" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
set "PWSH_INSTALL_PATH=C:\CLI_Tools\PowerShell\7
set "OLDPATH=%PATH%"
path "%PWSH_INSTALL_PATH%;%PATH%"
path "%OLDPATH%"
call :startPowerShellMainPrompt7
echo The script will now exit.
echo.
pause
goto exitBatchProgram
:startAbout
echo.
echo       Author: DavyJones324 (Alexander Summers)
echo      Details: This QOL program is meant to manage both versions 6 and 7 of PowerShell. Version 5 is not included.
echo               It is meant to eliminate partial backward incompatibility of running scripts designed for its platform.
echo Compatiblity: Both the Davy Jones OS Batch Script Launcher and the Desktop Screen itself
echo Release Date: XX/XX/XXXX
echo.
goto startPowerShellShortcutRedirectManager
:exitBatchProgram
cls
exit
:startComspec
echo List of Programs available (More can be added here):
echo 1. [INSERT CODE HERE]
echo 2. [INSERT CODE HERE]
echo 3. [INSERT CODE HERE]
echo.
SetLocal DisableDelayedExpansion
@echo on
@%comspec%