local M = {}
--
--- utility to archive asset page by page
---
local platform  = system.getInfo("platform")
print(platform)

if not (platform =="win32" or platform =="macos") then
    native.showAlert( "Kwik", "Please select Windows or macOS from View> View As > Custom", { "OK", "Cancel" })
end

local ROOT      = "BookServer"

local bookServerFolder    = "bookshelf"

local json = require("json")
local lfs = require( "lfs" )

local pageAssets = {}
local jsonFiles = {}

function M.setServerFolder(folder, parent)
    bookServerFolder = folder
    ROOT             = parent
end

function copy_books(model)
    local ext = "command"

    local sandboxPath = system.pathForFile('', system.ResourceDirectory)
    if platform =="win32" then
        ext = "bat"
        sandboxPath = sandboxPath:gsub('/', '\\')
    end

    local path = system.pathForFile( "copy_books."..ext..".tmplt", system.ResourceDirectory )
    local file, errorString = io.open( path, "r" )
    local cmd = "copy_books."..ext
    local cmdFile

    if not file then
        print( "File error: " .. errorString )
    else
        local contents = file:read( "*a" )
        io.close( file )
        local lustache = require "lustache"
        output = lustache:render(contents, model)

        local path = system.pathForFile(cmd, system.TemporaryDirectory)
        --print(path)
        local file, errorString = io.open( path, "w+" )
        if not file then
            print( "File error: " .. errorString )
        else
            output = string.gsub(output, "\r\n", "\n")
            file:write( output )
            io.close( file )
        end
        if platform =="win32" then
            cmdFile = '"'..path:gsub('/', '\\')..'"'
        else
            cmdFile = path:gsub(' ','\\ ')
        end
    end

    if platform =="win32" then
        print("copy "..cmdFile.." "..system.pathForFile("..\\", system.ResourceDirectory))
        os.execute("copy "..cmdFile.." "..system.pathForFile("..\\", system.ResourceDirectory))
        os.execute("cd "..system.pathForFile("..\\", system.ResourceDirectory) ..' & start cmd /k call '..cmd)
    else
        os.execute("cp "..cmdFile.." "..system.pathForFile("../", system.ResourceDirectory))
        print("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
        os.execute("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
    end
end

function M.copy_books (model)
    copy_books({folder = bookServerFolder,
                BookServer = ROOT,
                books = model})
end

return M

