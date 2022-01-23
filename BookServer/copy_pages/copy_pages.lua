local M = {}
-- 
--- utility to archive asset page by page
---
local platform  = system.getInfo("platform")

if not (platform =="win32" or platform =="macOS") then
    native.showAlert( "Kwik", "Please select Windows or macOS from View> View As > Custom", { "OK", "Cancel" })
end

local ROOT      = "BookServer"
local bookServerFolder    = "bookshelf"
local bookPageProject = "BookshelfPages"

local json = require("json")
local lfs = require( "lfs" )

local pageAssets = {}
local jsonFiles = {}

function M.setProject(proj)
    bookPageProject = proj
end

function M.setServerFolder(folder, parent)
    bookServerFolder = folder
    ROOT             = parent
end

function copy_pages(model)
    local ext = "command"

    local sandboxPath = system.pathForFile('', system.ResourceDirectory)
    if platform =="win32" then
        ext = "bat"
        sandboxPath = sandboxPath:gsub('/', '\\')
    end

    local path = system.pathForFile( "copy_pages."..ext..".tmplt", system.ResourceDirectory )
    local file, errorString = io.open( path, "r" )
    local cmd = "copy_pages."..ext

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
            cmd = '"'..path:gsub('/', '\\')..'"'
        else
            cmd = path:gsub(' ','\\ ')
        end
    end

    if platform =="win32" then   
        print("copy "..cmd.." "..system.pathForFile("..\\", system.ResourceDirectory))
        os.execute("copy "..cmd.." "..system.pathForFile("..\\", system.ResourceDirectory))
        os.execute("cd "..system.pathForFile("..\\", system.ResourceDirectory) ..' & start cmd /k call '..cmd)
    else
        os.execute("cp "..cmd.." "..system.pathForFile("../", system.ResourceDirectory))
        os.execute("cd "..system.pathForFile("..\\", system.ResourceDirectory) ..'; source '..cmd)
    end
end

function M.copy_pages (_model)
    local model = {}

    for k, v in pairs(_model) do
        local pageInfo = v
        print(k, v)

        for i=pageInfo.startPage, pageInfo.endPage do
            table.insert(model, {episode = pageInfo.episode, page=i})
        end
    end

    copy_pages({folder = bookServerFolder, 
                BookServer = ROOT,
                pages = model,
                project = bookPageProject})
end

return M

