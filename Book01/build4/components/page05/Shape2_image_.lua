-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 683/4
local imageHeight            = 604/4
local mX, mY                 = _K.ultimatePosition(1189, 776)
local oriAlpha = 1
--
local imagePath = "p5/shape2.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page5")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page5.png", _K.systemDir, info:getSheet() )
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
    layer.Shape2 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.Shape2 = newImageRect(shape2, imageWidth, imageHeight )
    if layer.Shape2 == nil then return end
    layer.Shape2.imagePath = imagePath
    layer.Shape2.x = mX
    layer.Shape2.y = mY
    layer.Shape2.alpha = oriAlpha
    layer.Shape2.oldAlpha = oriAlpha
    layer.Shape2.blendMode = ""
    layer.Shape2.oriX = layer.Shape2.x
    layer.Shape2.oriY = layer.Shape2.y
    layer.Shape2.oriXs = layer.Shape2.xScale
    layer.Shape2.oriYs = layer.Shape2.yScale
    layer.Shape2.name = "Shape2"
    sceneGroup.Shape2 = layer.Shape2
          sceneGroup:insert( layer.Shape2)
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