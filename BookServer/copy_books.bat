set fol=.\bookshelf
cd %HOMEPATH%\Documents\Kwik\BookServer

@rem for simple bookshelf
call :MyCopy Book01 book01
call :MyCopy Book02 book02

@rem for bookshelf with versions
call :MyCopy Book01en book01 en true
call :MyCopy Book01jp book01 jp
call :MyCopy Book02en book02 en true
call :MyCopy Book02jp book02 jp

exit /b

:MyCopy
echo MyCopy %1
copy  copyright.txt ..\%1\build4\assets\copyright.txt
copy ..\%1\build4\model.json  ..\%1\build4\assets\model.json
copy ..\%1\*.mp3 ..\%1\build4\assets\audios\
copy ..\%1\*.txt ..\%1\build4\assets\audios\
cd ..\%1\build4
move assets %2%3
rm ..\assets.zip
"C:\Program Files (x86)\Corona Labs\Corona\7za.exe" a ..\assets.zip %2%3
move %2%3 assets
cd %~dp0
mkdir  %fol%\%2%3
copy ..\%1\assets.zip %fol%\%2%3\assets.zip
copy ..\%1\build4\assets\images\p1\bg.png  %fol%\%2%3\bg.png
echo %4
if "%4"=="true" (
  mkdir  %fol%\%2
  copy ..\%1\build4\assets\images\p1\bg.png  %fol%\%2\bg.png
)
exit /b