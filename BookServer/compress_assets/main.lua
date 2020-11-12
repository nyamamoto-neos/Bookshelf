local command = require("compress_assets")

command.setServerFolder("macos", "bookshelf", "BookServer")
--command.setServerFolder("win32", "bookshelf")

local books = {
    {project = "Book01", serverFolder = "book01"},
    {project = "Book02", serverFolder = "book02"},
}

local onLineImages = {
    {project = "Book01", serverFolder = "book01en", image = "build4/assets/images/p1/bg@4x.png"},
    {project = "Book01", serverFolder = "book01jp", image = "build4/assets/images/p1/bg@4x.png"},
    {project = "Book02", serverFolder = "book02en", image = "build4/assets/images/p1/bg@4x.png"},
    {project = "Book02", serverFolder = "book02jp", image = "build4/assets/images/p1/bg@4x.png"},
}

-- for all the pages in a project
--
for i=1, #books do
    local book = books[i]
   command.compress(book.project, book.serverFolder)

end

-- thumbnail image in server, it is copied from page1, bg layer
--
for i=1, #onLineImages do
    local book = onLineImages[i]
    command.setOnlineImage(book.project, book.serverFolder, book.image) 
end
--
-- update page1, videos 
--
local project      = "Book02"
local serverFolder = "book02"
local page         = 1
local type         = "images"

--   command.updateAsset(project, serverFolder, page, type)

--[[
    "audios"
    "read2me"
    "PNGs"
    "sprites"
    "particles"
    "WWW"
    "thumbnails"
    "images"
    "shared"
]] 

local platform = system.getInfo("platform")
if platform == "macos" or platform == "win32" then
    native.requestExit()
end