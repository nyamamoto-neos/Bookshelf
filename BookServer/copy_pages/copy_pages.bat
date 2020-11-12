@echo off

set fol=..\bookshelf
set proj=%HOMEPATH%\Documents\Kwik\BookShelfPages
set server=%HOMEPATH%\Documents\Kwik\BookServer

call :MyCopy 2 4
call :MyCopy 2 5
call :MyCopy 3 6

exit /b

:MyCopy
echo %proj%\build4\assets\images\p%2
mkdir %fol%\Episode0%1
cd %fol%\Episode0%1
xcopy %proj%\build4\assets\images\p%2 assets\images\p%2 /D /S /R /Y /I /K
copy  %server%\copyright.txt assets\images\p%2
"C:\Program Files (x86)\Corona Labs\Corona SDK\7za.exe" a assets.zip assets
copy $proj/build4/assets/images/p%2/bg.png .
rmdir /s /q %proj%\build4\assets\images\p%1
cd %server%
exit /b

