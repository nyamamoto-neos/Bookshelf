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
local mX, mY                 = _K.ultimatePosition(960, 502)
local oriAlpha = 1
--
local imagePath = "p1/rect5.png"
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
    layer.rect5 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect5 = newImageRect(rect5, imageWidth, imageHeight )
    if layer.rect5 == nil then return end
    layer.rect5.imagePath = imagePath
    layer.rect5.x = mX
    layer.rect5.y = mY
    layer.rect5.alpha = oriAlpha
    layer.rect5.oldAlpha = oriAlpha
    layer.rect5.blendMode = ""
    layer.rect5.oriX = layer.rect5.x
    layer.rect5.oriY = layer.rect5.y
    layer.rect5.oriXs = layer.rect5.xScale
    layer.rect5.oriYs = layer.rect5.yScale
    layer.rect5.name = "rect5"
    sceneGroup.rect5 = layer.rect5
          sceneGroup:insert( layer.rect5)
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