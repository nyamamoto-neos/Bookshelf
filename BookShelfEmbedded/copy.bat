@echo off

rmdir /s /q  App
mkdir App

xcopy  ..\BookTOC\build4 App\TOC /D /S /R /Y /I /K
del App\TOC\main.lua
del App\TOC\config.lua
del App\TOC\build.settings
del App\TOC\assemble.command
del App\TOC\assemble.bat

call :MyCopy Book01 book01
call :MyCopy Book02 book02
exit /b

:MyCopy
	xcopy  ..\%1\build4 App\%2%3 /D /S /R /Y /I /K
	rmdir /s /q App\%2%3\assets
	del App\%2%3\main.lua
	del App\%2%3\config.lua
	del App\%2%3\build.settings
	del App\%2%3\assemble.command
	del App\%2%3\assemble.bat
)


