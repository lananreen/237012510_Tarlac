@echo off
echo Select one of three shapes:

:menu
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
choice /c 1234 /m "Choose an option: "

if errorlevel 4 goto end
if errorlevel 3 goto QuadrilateralSolve
if errorlevel 2 goto TriangleSolve
if errorlevel 1 goto CircleSolve

:CircleSolve
set /p radius="Enter the radius: "


set PI=31416

set /a SquaredRadius=radius*radius
set /a CircleArea=PI*SquaredRadius/10000

echo The area of the circle is: %CircleArea%
goto menu

:TriangleSolve
set /p A="Enter side A: "
set /p B="Enter side B: "
set /p B="Enter side C: "

set /a SemiP=(A+B+C)/2
set /a TriaArea=SemiP*(SemiP-A)*(SemiP-B)*(SemiP-C)

call :SquareRoot %TriaArea%
echo Area: %area%

if %sideA%==%sideB% (
    if %sideA%==%sideC% (
        echo It is an Equilateral triangle
    ) else if not %sideA%==%sideC% (
    echo It is an Isosceles triangle
    )
)
if not %sideA%==%sideB% (
    if %sideA%==%sideC% (
        echo It is an Isosceles triangle
    ) else if %sideB%==%sideC% (
        echo It is an Isosceles triangle
    ) else if not %sideB%==%sideC% (
        echo It is a Scalene triangle
    )
)
goto menu

:QuadrilateralSolve
set /p length="Enter the length: "
set /p width="Enter the width: "

set /a QuadArea=length*width
echo The area of the Quadrilateral is: %QuadArea%
if %length%==%width% echo It is a square
if not %length%==%width% echo It is a rectangle
goto menu

:SquareRoot
    SETLOCAL EnableDelayedExpansion
    set root=1
    set /a sqr=%root%*%root%
    :Loop
    if %sqr% LSS %number% (
        set /a root=!root!+1
        set /a sqr=!root!*!root!
        goto Loop
    )
(EndLocal && set area=%root% && exit /B)

:end 
echo Thank you!