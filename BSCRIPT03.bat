@echo off
echo Select one task to execute:

:menu
echo.
echo 1. Ipconfig
echo 2. Tasklist/Taskkill 
echo 3. Chkdsk
echo 4. Format
echo 5. Defrag
echo 6. Find
echo 7. Attrib.
echo 8. Exit
choice /c 12345678 /m "Choose an option: "

if errorlevel 8 goto end
if errorlevel 7 goto UserAttrib
if errorlevel 6 goto UserFind
if errorlevel 5 goto UserDefrag
if errorlevel 4 goto UserFormat
if errorlevel 3 goto UserChkdsk
if errorlevel 2 goto UserTask
if errorlevel 1 goto UserIpconfig

:UserIpconfig
ipconfig
goto menu

:UserTask
echo Select one task to execute:
echo 1. Tasklist
echo 2. Taskkill
echo 3. Back to menu
choice /c 123 /m "Choose an option: "

if errorlevel 3 goto menu
if errorlevel 2 goto UserTaskkill
if errorlevel 1 goto UserTasklist

:UserTasklist
tasklist
goto menu

:UserTaskkill
set /p fileName="Please enter the name of the process to kill: "

taskkill /IM %fileName% /F
if %errorlevel% equ 0 (
   goto menu
) else (
    echo Failed to terminate %processName%.
    goto menu
)

:UserChkdsk
chkdsk
goto menu

:UserFormat
set /p driveName="Please enter the drive to check (Add a colon, e.g. D:): "
format %driveName%
if %errorlevel% equ 0 (
   goto menu
) else (
    echo Failed to check %driveName%.
    goto menu
)

:UserDefrag
set /p driveName="Enter the drive to defrag (e.g., C:): "
defrag %driveName%
if %errorlevel% equ 0 (
   goto menu
) else (
    echo Failed to check %driveName%.
    goto menu
)

:UserFind
set /p Link="Enter string to search: "
find "%Link%"
if %errorlevel% equ 0 (
   goto menu
) else (
    echo Failed to check %Link%.
    goto menu
)

:UserAttrib
set /p pathName="Enter path of a file or directory: "
attrib %pathName%
if %errorlevel% equ 0 (
   goto menu
) else (
    echo Failed to check %pathName%.
    goto menu
)

:end
echo Thank you!

