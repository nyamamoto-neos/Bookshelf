local M = {}
--
--- utility to archive asset page by page
---
local platform  = system.getInfo("platform")

if not (platform =="win32" or platform =="macos") then
    native.showAlert( "Kwik", "Please select Windows or macOS from View> View As > Custom", { "OK", "Cancel" })
end

local ROOT      = "BookShelfEmbedded"

local appFolder    = "App"

local json = require("json")
local lfs = require( "lfs" )

local pageAssets = {}
local jsonFiles = {}

function M.setServerFolder(folder, parent)
    appFolder = folder
    ROOT             = parent
end

function copy_projects(model)
    local ext = "command"

    local sandboxPath = system.pathForFile('', system.ResourceDirectory)
    if platform =="win32" then
        ext = "bat"
        sandboxPath = sandboxPath:gsub('/', '\\')
    end

    local path = system.pathForFile( "copy_projects."..ext..".tmplt", system.ResourceDirectory )
    local file, errorString = io.open( path, "r" )
    local cmd = "copy_projects."..ext
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
        print("cp "..cmdFile.." "..system.pathForFile("../", system.ResourceDirectory))
        os.execute("cp "..cmdFile.." "..system.pathForFile("../", system.ResourceDirectory))
        print("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
        os.execute("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
    end
end

function M.copy_projects (model)

    copy_projects({folder = appFolder,
                RootProject = ROOT,
                projects = model})
end

local moveDir = nil

local function moveAll(rootDir, dstDir)
    local file = nil
    for file in lfs.dir( rootDir ) do
        if file and file:len() > 2 then
            moveDir(rootDir, dstDir, file)
        end
    end
end

moveDir = function(rootDir, dstDir, file)
    local src = rootDir.."/"..file
    local dst = dstDir .."/"..file
    if platform =="win32" then
        dst = dst:gsub('/', '\\')
    else
        dst = dst:gsub(' ','\\ ')
    end
    -- simply one level below
    if lfs.attributes( src, "mode" ) == "directory" then
        moveAll(src, dst)
    else
        local result, reason = os.rename(src,dst)
        if( not result ) then
            print("", "error", reason)
            print("", src, dst)
        else
            print( "moved:" .. src)
        end
    end
end

function M.copy_components(model)
    local lfs = require( "lfs" )
     -- Get raw path to the app documents directory
    local rootDir, distDir
    local file = nil
    for k, v in pairs(model) do
        rootDir = system.pathForFile( "../App/"..v.appFolder.."/components", system.ResourceDirectory )
        dstDir = system.pathForFile("../components",system.ResourceDirectory)
        for file in lfs.dir( rootDir ) do
            local isKwik = file:find("kwik")
            local isPage = file:find("page")
            local isStore = file:find("store")

            if not isPage and file:len() > 2 then
                if v.appFolder=="TOC" then
                    if not isKwik then
                       -- print(rootDir, dstDir, file)
                       moveDir(rootDir, dstDir, file)
                    end
                else
                    if not (isStore or isKwik) then
                       -- print(rootDir, dstDir, file)
                       moveDir(rootDir, dstDir, file)
                    end
                end
            end
        end
        --
        rootDir = system.pathForFile( "../App/"..v.appFolder.."/commands", system.ResourceDirectory )
        dstDir = system.pathForFile("../commands",system.ResourceDirectory)
        for file in lfs.dir( rootDir ) do
            -- local isKwk = file:find("kwik")
            local isPage = file:find("page")
            local isKwik = file:find("kwik")
            local isApp = file:find("app")
            if (not isApp) and (not isKwik) and (not isPage) and file:len() > 2 then
                moveDir(rootDir, dstDir, file)
            end
        end
        --
        rootDir = system.pathForFile( "../App/"..v.appFolder.."/extlib", system.ResourceDirectory )
        dstDir = system.pathForFile("../extlib",system.ResourceDirectory)
        moveAll(rootDir, dstDir)
    end
end

return M

