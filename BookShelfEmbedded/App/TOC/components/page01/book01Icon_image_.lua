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
local imageWidth             = 451/4
local imageHeight            = 222/4
local mX, mY                 = _K.ultimatePosition(431, 227)
local oriAlpha = 1
--
local imagePath = "p1/book01icon.png"
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
    layer.book01Icon = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.book01Icon = newImageRect(book01icon, imageWidth, imageHeight )
    if layer.book01Icon == nil then return end
    layer.book01Icon.imagePath = imagePath
    layer.book01Icon.x = mX
    layer.book01Icon.y = mY
    layer.book01Icon.alpha = oriAlpha
    layer.book01Icon.oldAlpha = oriAlpha
    layer.book01Icon.blendMode = ""
    layer.book01Icon.oriX = layer.book01Icon.x
    layer.book01Icon.oriY = layer.book01Icon.y
    layer.book01Icon.oriXs = layer.book01Icon.xScale
    layer.book01Icon.oriYs = layer.book01Icon.yScale
    layer.book01Icon.name = "book01Icon"
    sceneGroup.book01Icon = layer.book01Icon
          sceneGroup:insert( layer.book01Icon)
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