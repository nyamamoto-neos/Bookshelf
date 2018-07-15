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
local mX, mY                 = _K.ultimatePosition(431, 1052)
local oriAlpha = 1
--
local imagePath = "p1/rect10.png"
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
    layer.rect10 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.rect10 = newImageRect(rect10, imageWidth, imageHeight )
    if layer.rect10 == nil then return end
    layer.rect10.imagePath = imagePath
    layer.rect10.x = mX
    layer.rect10.y = mY
    layer.rect10.alpha = oriAlpha
    layer.rect10.oldAlpha = oriAlpha
    layer.rect10.blendMode = ""
    layer.rect10.oriX = layer.rect10.x
    layer.rect10.oriY = layer.rect10.y
    layer.rect10.oriXs = layer.rect10.xScale
    layer.rect10.oriYs = layer.rect10.yScale
    layer.rect10.name = "rect10"
    sceneGroup.rect10 = layer.rect10
          sceneGroup:insert( layer.rect10)
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