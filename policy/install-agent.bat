@echo off
setlocal

set "serviceToCheck=OCS Inventory Service" 
set "agentName=OCSPackage.exe"
set "programRoute=<ROUTE_TO_AGENT_INSTALLER_EXE_FILE>\%agentName%"

sc query "%serviceToCheck%" >nul
set "errorCode=%errorlevel%"
echo %errorCode%
if %errorCode% neq 0 (
    echo Service %serviceToCheck% is not installed.
    echo installing the program...
    REM curl -o programa.exe "%program%"
	copy %programRoute% %agentName%
    %agentName%
) else (
    sc query "%serviceToCheck%" | find "RUNNING" >nul
	set "errorCode2=%errorlevel%"
    echo %errorCode2%
    if %errorCode2% neq 0 (
        echo Service %serviceToCheck% is installed but not running. Initializing the service...
        net start "%serviceToCheck%"
    ) else (
        echo Service %serviceToCheck% is installed and running... Nothing to be done!
    )
)

endlocal


