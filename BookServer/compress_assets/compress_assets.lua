--
-- utility to archive asset page by page
--
local M = {}

local platform  = system.getInfo("platform")
print(platform)

if not (platform =="win32" or platform =="macos") then
    native.showAlert( "Kwik", "Please select Windows or macOS from View> View As > Custom", { "OK", "Cancel" })
end

local ROOT      = "BookServer"

--local bookProject = "AssetInfo"
local bookProject         = "SpringEn"
local bookServerFolder    = "hokkaido"
local bookProjectInServer = "SpringEn"

local json = require("json")
local lfs = require( "lfs" )

local pageAssets = {}
local jsonFiles = {}


--[[
    {
        "page":1,"alias":"page1","isTmplt":false,
        "audios":["lame.wav",null],
        "read2me":[{"foldername":"data", "filenames":["read.mp3","to.mp3","me.mp3","word.mp3","by.mp3","word.mp3","audio.mp3",null] },null],
        "videos":["kwikplanet.mp4",null],
        "PNGs":["elephant",null],
        "sprites":["butflysprite@4x.png","butflysprite@2x.png","butflysprite.png",null],
        "particles":[{"filename":"air_stars.json","PNG":"air_stars.png"},null],
        "WWW":[{"filename":"index.html","foldername":"img"},null],
        "thumbnails":["p1_thumb@4x.png","p1_thumb@2x.png","p1_thumb.png",null],
        "images":[
            "p1/layer_1@4x.png", "p1/layer_1@2x.png", "p1/layer_1.png",
            null
            ],
            "shared":[
                "shared@4x.png", "shared@2x.png", "shared.png",
                null
                ]
    }


    model ={
        folder = "./hokkaido/AssetInfo",
        assets = {
            {page = 1, type="audios", files={"lame.wav"},
            {page = 1, type="read2me", files={"data/"read.mp3", "data/to.mp3" ... data2/xx.mp3 ... }},
            ...
            ...
            {page = 2, type="audios", files={"yyy.wav"},
            ...
            ...
        }
    }
    --]]


function insertAudios(page,data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "audios/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="audios", files = files})
end

function  insertRead2me(page, data)
    local files = {}
    for i=1, #data do
        local read2me = data[i]
        if read2me then
            for j=1, #read2me.filenames do
                if read2me.filenames[j] then
                    table.insert(files, "audios/"..read2me.foldername.."/"..read2me.filenames[j])
                end
            end
        end
    end
    table.insert(pageAssets, {page= page, type="read2me", files = files})
end

function insertVideos(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "videos/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="videos", files = files})
end

function insertPNGs(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "videos/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="PNGs", files = files})
end

function insertSprites(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "sprites/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="sprites", files = files})
end

function insertParticles(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "particles/"..data[i].filename)
            table.insert(files, "particles/"..data[i].PNG)
        end
    end
    table.insert(pageAssets, {page= page, type="particles", files = files})
end

function insertWWW(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "WWW/"..data[i].filename)
            table.insert(files, "WWW/"..data[i].foldername)
        end
    end
    table.insert(pageAssets, {page= page, type="WWW", files = files})
end

function insertThumbnails(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "thumbnails/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="thumbnails", files = files})
end

function insertImages(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "images/p"..page.."/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="images", files = files})
end

function insertShared(page, data)
    local files = {}
    for i=1, #data do
        if data[i] then
            table.insert(files, "images/"..data[i])
        end
    end
    table.insert(pageAssets, {page= page, type="shared", files = files})
end


function readAssetJson(bookProjectFolder)
    local path = system.pathForFile(bookProjectFolder.."/build4/assets/", system.ResourceDirectory )
    print("readAssetJson", path)
    local num = 0
   	for file in lfs.dir(path ) do
        print( "Found file: " .. file )
        if file:find(".json") ~=nil and file:find("page") ~=nil then
            local path = system.pathForFile(bookProjectFolder.."/build4/assets/"..file, system.ResourceDirectory )
            local decoded, pos, msg = json.decodeFile( path )
            if not decoded then
                print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
            else
                if (decoded.audios == nil) then
                    print("Error: Something wrong with tmplt/assets/model.json  ")
                    return num
                end
                insertAudios(decoded.page, decoded.audios)
                insertRead2me(decoded.page, decoded.read2me)
                insertVideos(decoded.page, decoded.videos)
                insertPNGs(decoded.page, decoded.PNGs)
                insertSprites(decoded.page, decoded.sprites)
                insertParticles(decoded.page, decoded.particles)
                insertWWW(decoded.page, decoded.WWW)
                insertThumbnails(decoded.page, decoded.thumbnails)
                insertImages(decoded.page, decoded.images)
                insertShared(decoded.page, decoded.shared)
                num = num + 1

                table.insert(jsonFiles, path)


            end
        end
    end
    return num
end

function zip(model)
    local ext = "command"

    local sandboxPath = system.pathForFile('', system.ResourceDirectory)
    if platform =="win32" then
        ext = "bat"
        sandboxPath = sandboxPath:gsub('/', '\\')
    end

    local path = system.pathForFile( "compress_assets."..ext..".tmplt", system.ResourceDirectory )
    local file, errorString = io.open( path, "r" )
    local cmd = "compress_assets_"..bookProject.."."..ext
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
        print("copy "..cmdFile.." "..system.pathForFile("", system.ResourceDirectory))
        os.execute("copy "..cmdFile.." "..system.pathForFile("..\\", system.ResourceDirectory))
        os.execute("cd "..system.pathForFile("..\\", system.ResourceDirectory) ..' & start cmd /k call '..cmd)
    else
        os.execute("cp "..cmdFile.." "..system.pathForFile("../", system.ResourceDirectory))
        print("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
        os.execute("cd "..system.pathForFile("../", system.ResourceDirectory) ..'; source '..cmd)
    end
end

function isFile(name)
    if type(name)~="string" then return false end
    if not isDir(name) then
        return os.rename(name,name) and true or false
        -- note that the short evaluation is to
        -- return false instead of a possible nil
    end
    return false
end

function isFileOrDir(name)
    if type(name)~="string" then return false end
    return os.rename(name, name) and true or false
end

function isDir(name)
    if type(name)~="string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(name) and true or false
    lfs.chdir(cd)
    return is
end

function initAssetFolders(bookServerFolder, numOfpages)
    local _path = system.pathForFile(bookServerFolder, system.ResourceDirectory )
    -- Change current working directory
    local success = lfs.chdir( _path )  --returns true on success

    if ( success ) then
        if not isFileOrDir(bookProjectInServer) then
            lfs.mkdir( bookProjectInServer)
        else
            os.remove(system.pathForFile(bookServerFolder .."/"..bookProjectInServer, system.ResourceDirectory ))
            lfs.mkdir( bookProjectInServer)
        end
        lfs.chdir(bookProjectInServer)
        for i=1, numOfpages do
            lfs.mkdir( "p"..i)
        end
    end
end

function createAssetPageFolder(bookServerFolder, bookProjectInServer, pageNum)
    print("createAssetPageFolder", bookServerFolder, bookProjectInServer, pageNum)
    local _path = system.pathForFile(bookServerFolder, system.ResourceDirectory )
    -- Change current working directory
    local success = lfs.chdir( _path )  --returns true on success

    if ( success ) then
        if not isFileOrDir(bookProjectInServer) then
            lfs.mkdir( bookProjectInServer)
        end
        lfs.chdir(bookProjectInServer)
        if not isFileOrDir("p"..pageNum) then
            lfs.mkdir( "p"..pageNum)
        end
    end
end

function updateAsset(page, type)
    local path = system.pathForFile("../../"..bookProject.."/build4/assets/page"..page..".json", system.ResourceDirectory )
    print("updateAsset", bookProject.."/build4/assets/page"..page..".json")
    local decoded, pos, msg = json.decodeFile( path )
    if not decoded then
        print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
        return
    end
    if type=="audios" then
        insertAudios(decoded.page, decoded.aduios)
    elseif (type == "read2me") then
        insertRead2me(decoded.page, decoded.read2me)
    elseif (type == "videos") then
        insertVideos(decoded.page, decoded.videos)
    elseif (type == "PNGs") then
        insertPNGs(decoded.page, decoded.PNGs)
    elseif (type == "sprites") then
        insertSprites(decoded.page, decoded.sprites)
    elseif (type == "particles") then
        insertParticles(decoded.page, decoded.particles)
    elseif (type == "WWW") then
        insertWWW(decoded.page, decoded.WWW)
    elseif (type == "thumbnails") then
        insertThumbnails(decoded.page, decoded.thumbnails)
    elseif (type == "images") then
        insertImages(decoded.page, decoded.images)
    elseif (type == "shared") then
        insertShared(decoded.page, decoded.shared)
    end

    print(bookServerFolder .."/"..bookProjectInServer.."/p"..page)
    local _path = system.pathForFile("../"..bookServerFolder .."/"..bookProjectInServer.."/p"..page, system.ResourceDirectory)
    print(_path)
    local success = lfs.chdir( _path )  --returns true on success

    if not isFileOrDir(type..".zip") then
        os.remove(_path.."/"..type..".zip")
    end
    zip({assets = pageAssets, folder = bookServerFolder.."/"..bookProjectInServer,
        assetFolder = system.pathForFile("../../"..bookProject.."/build4/assets", system.ResourceDirectory )})

end


function copyJsons(bookServerFolder, bookProject)
    local dst = system.pathForFile(bookServerFolder.."/"..bookProject, system.ResourceDirectory)
    for i=1, #jsonFiles do
        local path = jsonFiles[i]
        if platform =="win32" then
            local cmd = "copy "..path.." "..dst
            cmd = cmd:gsub('/', '\\')
            print(cmd)
            os.execute(cmd)
        else
            local cmd = "cp "..path.." "..dst
            print(cmd)
            os.execute(cmd)
        end
    end
end

function M.setServerFolder(folder, parent)
    bookServerFolder = folder
    ROOT             = parent
end


local function setSize(t, type, path)
    local attr = nil
    local _path = path .."/"..type..".zip"

    if platform =="win32" then
        _path = _path:gsub('/', '\\')
    end

    if isFile(_path) then
        attr = lfs.attributes(_path)
    end
    if attr ~= nil then
        t[type]= {date = attr.modification, size=attr.size}
    else
        t[type] = nil
    end
end

function calcSize(numOfpages, folder)
    local model = {}
    for i=1, numOfpages do
        local t = {}
        local path = system.pathForFile(folder.."/p"..i, system.ResourceDirectory)
        setSize(t, "audios", path)
        setSize(t, "read2me", path)
        setSize(t, "PNGs", path)
        setSize(t, "sprites", path)
        setSize(t, "particles", path)
        setSize(t, "WWW", path)
        setSize(t, "thumbnails", path)
        setSize(t, "images", path)
        setSize(t, "shared", path)
        setSize(t, "videos", path)
        t.page = i
        table.insert(model, t)
    end

    local path = system.pathForFile(folder, system.ResourceDirectory)
    print(path)
    local file, errorString = io.open( path.."/assets.json", "w+" )
    if not file then
        print( "File error:calcSize " .. errorString )
    else
        output = json.encode(model)
        file:write( output )
        io.close( file )
    end

end

M.calcSize = function(project, serverFolder)
    bookProject = project
    bookProjectInServer = serverFolder
    -- process all pages
    local numOfpages = readAssetJson("../../"..bookProject)
    --
    --
    calcSize(numOfpages, "../"..bookServerFolder.."/"..bookProjectInServer)

end

function M.compress (project, serverFolder)
    bookProject = project
    bookProjectInServer = serverFolder
    -- process all pages
    local numOfpages = readAssetJson("../../"..bookProject)
    --
    initAssetFolders("../"..bookServerFolder, numOfpages)
    --

    zip({assets = pageAssets, folder = bookServerFolder.."/"..bookProjectInServer, BookServer = ROOT,
         assetFolder = system.pathForFile("../../"..bookProject.."/build4/assets", system.ResourceDirectory )})


    calcSize(numOfpages, "../"..bookServerFolder.."/"..bookProjectInServer)

    copyJsons("../"..bookServerFolder, bookProjectInServer)
end

function M.updateAsset(project, serverFolder, page, type)
    bookProject = project
    bookProjectInServer = serverFolder

    createAssetPageFolder("../"..bookServerFolder, bookProjectInServer, page)

    updateAsset(page, type)

    -- process all pages
    local numOfpages = readAssetJson("../../"..bookProject)

    -- update size and date
    calcSize(numOfpages, "../"..bookServerFolder.."/"..bookProjectInServer)

    copyJsons("../"..bookServerFolder, bookProjectInServer)

end

function M.setOnlineImage(project, serverFolder, imagePath)
    bookProject = project
    bookProjectInServer = serverFolder
    local projectFolder = system.pathForFile("../../"..bookProject, system.ResourceDirectory )
    local path = projectFolder.."/"..imagePath

    local _path = system.pathForFile("../"..bookServerFolder, system.ResourceDirectory )
    -- Change current working directory
    local success = lfs.chdir( _path )  --returns true on success

    if ( success ) then
        if not isFileOrDir(bookProjectInServer) then
            lfs.mkdir( bookProjectInServer)
        end
    end

    local dst = system.pathForFile("../"..bookServerFolder.."/"..bookProjectInServer .."/", system.ResourceDirectory)
    print("---setOnlineImage-----")
    if platform =="win32" then
        local cmd = "copy "..path.." "..dst .."bg.png"
        cmd = cmd:gsub('/', '\\')
        print(cmd)
        os.execute(cmd)
    else
        local cmd = "cp -f "..path.." "..dst.."bg.png"
        print(cmd)
        os.execute(cmd)
    end

end

return M

