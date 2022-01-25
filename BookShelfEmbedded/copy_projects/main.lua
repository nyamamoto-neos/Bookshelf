-- copyright 2022, kwiksher
local command = require("copy_projects")
--
local model = {
    {project = "BookTOC", appFolder = "TOC", suffix="", downloadable=false},
    {project = "Book01", appFolder = "book01", suffix="", downloadable=true},
    {project = "Book02", appFolder = "book02", suffix="", downloadable=true},
}

-- for bookshelf with versions
--[[

  local model = {
    {project = "BookTOCen", appFolder = "TOC", suffix="en", downloadable=false},
    {project = "BookTOCjp", appFolder = "TOC", suffix="jp"", downloadable=false},
    {project = "Book01en",  appFolder = "book01", suffix="en", downloadable=true},
    {project = "Book01jp",  appFolder = "book01", suffix="jp", downloadable=true},
    {project = "Book02en",  appFolder = "book02", suffix="en", downloadable=true},
    {project = "Book02jp",  appFolder = "book02", suffix="jp", downloadable=true},
  }
--]]

--
-- Files under App/TOC/components/store are moved to components/store
-- you can edit the debug flag in  components/store/model.lua
--
-- If the components folder of TOC, BookXX contains sub folder like crosswaord, tiledmap etc,
-- the sub folders are moved to the omponents of the root. This solves references of require()
--

---
local function onComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          command.copy_projects(model)
          command.copy_components(model)
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
local alert = native.showAlert( "Kwik", "Copy projects?", { "OK", "Cancel" }, onComplete )
