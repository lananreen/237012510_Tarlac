@echo off


mkdir "Z:\archive"
echo Sorting and old text files on C: to Z:
forfiles /p C:\ /s /m * txt /d -30 /c "cmd /c move @path \"Z: \archive\""

mkdir "Z:\archive\archivedfiles"
echo Sorting archived files by size to temp directory
for /f "tokens=*" %%A in ('dir /b /s /o-s "Z: \archive\****)'dir /b /s /o-s "Z: \archive\****) do (
    move "%%A" "Z: \archive\archivedfiles"
)

echo Files have been moved to Z:\archive\archivedfiles 
dir Z: \archive\archivedfiles\*.*

set /p delete="Do you want to delete files? (Y/N): "
if /i "%delete%"=="Y" (
    cd Z: \archive archivedfiles 
    del ** /s 
    rd Z: \archive\archivedfiles 
    echo Files deleted successfully.
) else (
    echo No files were deleted.
)