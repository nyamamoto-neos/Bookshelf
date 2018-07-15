-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 337/4
local imageHeight            = 162/4
local mX, mY                 = _K.ultimatePosition(1498, 151)
local oriAlpha = 1
--
local imagePath = "p1/title.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page1")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page1.png", _K.systemDir, info:getSheet() )
local sequence = {start=1, count= #info:getSheet().frames }
function newImageRect(name, width, height)
  local image
  if string.find(name, "background") == nil then
      image = display.newSprite(sheet, sequence)
      image.name = name
      image:setFrame (info:getFrameIndex (name))
      image.width, image.height = width, height
      else
       image = display.newImageRect(_K.imgDir..name.."."..png, _K.systemDir, width, height)
      end
   return image
end
--]]
--
function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
    local function myNewImage()
    layer.title = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.title = newImageRect(title, imageWidth, imageHeight )
    if layer.title == nil then return end
    layer.title.imagePath = imagePath
    layer.title.x = mX
    layer.title.y = mY
    layer.title.alpha = oriAlpha
    layer.title.oldAlpha = oriAlpha
    layer.title.blendMode = ""
    layer.title.oriX = layer.title.x
    layer.title.oriY = layer.title.y
    layer.title.oriXs = layer.title.xScale
    layer.title.oriYs = layer.title.yScale
    layer.title.name = "title"
    sceneGroup.title = layer.title
          sceneGroup:insert( layer.title)
    --
    end
    myNewImage()
end
--
function _M:didShow(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function _M:toDispose(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function  _M:toDestory()
end
--
return _M