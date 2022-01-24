fol=.\App
RootProject=BookShelfEmbedded


MyCopy(){
	cp -R ../$1/build4 App/$2
	if [ "$3" = "true" ]; then
		rm -d -R App/$2/assets
	fi
	rm App/$2/main.lua
	rm App/$2/config.lua
	rm App/$2/build.settings
	rm App/$2/assemble.command
	rm App/$2/assemble.bat
}

rm -d -R App
mkdir App

MyCopy BookTOC TOC 
MyCopy Book01 book01 true
MyCopy Book02 book02 true
