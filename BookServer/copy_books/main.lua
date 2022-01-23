-- copyright 2022, kwiksher
local command = require("copy_books")
--
command.setServerFolder("bookshelf", "BookServer")
--
local model = {
    {project = "Book01", serverFolder = "book01", suffix=""},
    {project = "Book02", serverFolder = "book02", suffix=""},
}

-- for bookshelf with versions
--[[

  local books = {
    {project = "Book01en", serverFolder = "book01", suffix="en", copyBackgroundImage=true},
    {project = "Book01jp", serverFolder = "book01", suffix="jp"},
    {project = "Book02en", serverFolder = "book02", suffix="en", copyBackgroundImage=true},
    {project = "Book02jp", serverFolder = "book02", suffix="jp"},
    
  }
--]]

---
local function onComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          command.copy_books(model)
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
local alert = native.showAlert( "Kwik", "Copy books?", { "OK", "Cancel" }, onComplete )
