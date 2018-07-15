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
local mX, mY                 = _K.ultimatePosition(960, 1052)
local oriAlpha = 1
--
local imagePath = "p1/rect11.png"
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
    layer.rect11 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect11 = newImageRect(rect11, imageWidth, imageHeight )
    if layer.rect11 == nil then return end
    layer.rect11.imagePath = imagePath
    layer.rect11.x = mX
    layer.rect11.y = mY
    layer.rect11.alpha = oriAlpha
    layer.rect11.oldAlpha = oriAlpha
    layer.rect11.blendMode = ""
    layer.rect11.oriX = layer.rect11.x
    layer.rect11.oriY = layer.rect11.y
    layer.rect11.oriXs = layer.rect11.xScale
    layer.rect11.oriYs = layer.rect11.yScale
    layer.rect11.name = "rect11"
    sceneGroup.rect11 = layer.rect11
          sceneGroup:insert( layer.rect11)
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