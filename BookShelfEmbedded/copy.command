rm -d -R App
mkdir App

cp -R ../BookTOC/build4 App/TOC
rm App/TOC/main.lua
rm App/TOC/config.lua
rm App/TOC/build.settings
rm App/TOC/assemble.command
rm App/TOC/assemble.bat

MyCopy(){
	cp -R ../$1/build4 App/$2$3
	rm -d -R App/$2$3/assets
	rm App/$2$3/main.lua
	rm App/$2$3/config.lua
	rm App/$2$3/build.settings
	rm App/$2$3/assemble.command
	rm App/$2$3/assemble.bat
}

MyCopy Book01 book01
MyCopy Book02 book02
