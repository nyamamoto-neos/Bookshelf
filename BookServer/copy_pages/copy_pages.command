fol=../bookshelf
proj=~/Documents/Kwik/BookshelfPages
server=~/Documents/Kwik/BookServer
root=$(pwd)

MyCopy(){
	mkdir -p $fol/Episode0$1/assets/images/
	cp -R $proj/build4/assets/images/p$2 $fol/Episode0$1/assets/images
	cp $server/copyright.txt $fol/Episode0$1/assets/images/p$2
	cd $fol/Episode0$1
	zip -r assets.zip assets
	cp $proj/build4/assets/images/p$2/bg.png .
	rm -d -R  $proj/build4/assets/images/p$2
	cd $root
}

MyCopy 2 4
MyCopy 2 5
MyCopy 3 6

