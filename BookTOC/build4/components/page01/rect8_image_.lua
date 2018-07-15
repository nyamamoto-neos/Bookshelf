-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 449/4
local imageHeight            = 222/4
local mX, mY                 = _K.ultimatePosition(960, 777)
local oriAlpha = 1
--
local imagePath = "p1/rect8.png"
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
    layer.rect8 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect8 = newImageRect(rect8, imageWidth, imageHeight )
    if layer.rect8 == nil then return end
    layer.rect8.imagePath = imagePath
    layer.rect8.x = mX
    layer.rect8.y = mY
    layer.rect8.alpha = oriAlpha
    layer.rect8.oldAlpha = oriAlpha
    layer.rect8.blendMode = ""
    layer.rect8.oriX = layer.rect8.x
    layer.rect8.oriY = layer.rect8.y
    layer.rect8.oriXs = layer.rect8.xScale
    layer.rect8.oriYs = layer.rect8.yScale
    layer.rect8.name = "rect8"
    sceneGroup.rect8 = layer.rect8
          sceneGroup:insert( layer.rect8)
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