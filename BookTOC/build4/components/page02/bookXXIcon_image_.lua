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
local imageWidth             = 658/4
local imageHeight            = 434/4
local mX, mY                 = _K.ultimatePosition(978, 587)
local oriAlpha = 1
--
local imagePath = "p2/bookxxicon.png"
--
function _M:localVars(UI)
    end
--
--[[
local info     = require ("assets.sprites.".."page2")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page2.png", _K.systemDir, info:getSheet() )
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
    layer.bookXXIcon = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.bookXXIcon = newImageRect(bookxxicon, imageWidth, imageHeight )
    if layer.bookXXIcon == nil then return end
    layer.bookXXIcon.imagePath = imagePath
    layer.bookXXIcon.x = mX
    layer.bookXXIcon.y = mY
    layer.bookXXIcon.alpha = oriAlpha
    layer.bookXXIcon.oldAlpha = oriAlpha
    layer.bookXXIcon.blendMode = ""
    layer.bookXXIcon.oriX = layer.bookXXIcon.x
    layer.bookXXIcon.oriY = layer.bookXXIcon.y
    layer.bookXXIcon.oriXs = layer.bookXXIcon.xScale
    layer.bookXXIcon.oriYs = layer.bookXXIcon.yScale
    layer.bookXXIcon.name = "bookXXIcon"
    sceneGroup.bookXXIcon = layer.bookXXIcon
          sceneGroup:insert( layer.bookXXIcon)
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