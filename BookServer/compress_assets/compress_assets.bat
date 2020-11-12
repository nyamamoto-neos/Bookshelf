set fol=../../../BookServer/hokkaido/AssetInfo
cd  C:\Users\ymmtny\Documents\GitHub\hokkaido\develop\Kwik\BookServer\compress_assets\../../AssetInfo/build4/assets

zip -r %fol%/p1/audios.zip audios/lame.wav 
zip -r %fol%/p1/read2me.zip audios/data/read.mp3 audios/data/to.mp3 audios/data/me.mp3 audios/data/word.mp3 audios/data/by.mp3 audios/data/word.mp3 audios/data/audio.mp3 
zip -r %fol%/p1/videos.zip videos/kwikplanet.mp4 
zip -r %fol%/p1/PNGs.zip videos/elephant 
zip -r %fol%/p1/sprites.zip sprites/butflysprite@4x.png sprites/butflysprite@2x.png sprites/butflysprite.png 
zip -r %fol%/p1/particles.zip particles/air_stars.json particles/air_stars.png 
zip -r %fol%/p1/WWW.zip WWW/index.html WWW/img 
zip -r %fol%/p1/thumbnails.zip thumbnails/p1_thumb@4x.png thumbnails/p1_thumb@2x.png thumbnails/p1_thumb.png 
zip -r %fol%/p1/images.zip images/p1/layer_1@4x.png images/p1/layer_1@2x.png images/p1/layer_1.png 
zip -r %fol%/p1/shared.zip images/shared@4x.png images/shared@2x.png images/shared.png 
zip -r %fol%/p2/audios.zip 
zip -r %fol%/p2/read2me.zip 
zip -r %fol%/p2/videos.zip 
zip -r %fol%/p2/PNGs.zip 
zip -r %fol%/p2/sprites.zip 
zip -r %fol%/p2/particles.zip 
zip -r %fol%/p2/WWW.zip 
zip -r %fol%/p2/thumbnails.zip thumbnails/p2_thumb@4x.png thumbnails/p2_thumb@2x.png thumbnails/p2_thumb.png 
zip -r %fol%/p2/images.zip images/p2/bg@4x.png images/p2/bg@2x.png images/p2/bg.png images/p2/sharedtest@4x.png images/p2/sharedtest@2x.png images/p2/sharedtest.png 
zip -r %fol%/p2/shared.zip 

exit