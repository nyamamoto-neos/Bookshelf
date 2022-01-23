-- copyright 2022, kwiksher
local command = require("copy_pages")
--
command.setServerFolder("bookshelf", "BookServer")
---
command.setProject("BookshelfPages")
--
local model = {
    {episode = 2, startPage=4, endPage=5},
    {episode = 3, startPage=6, endPage=6},
}

---
local function onComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          command.copy_pages(model)
          native.showAlert( "Kwik", "Done", { "OK", "Cancel" }, 
            function()
              native.requestExit()
            end )
        elseif ( i == 2 ) then
          print("cancelled")
            native.requestExit()
        end
    end
end
---
local alert = native.showAlert( "Kwik", "Copy pages?", { "OK", "Cancel" }, onComplete )
