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
local imageWidth             = 233/4
local imageHeight            = 56/4
local mX, mY                 = _K.ultimatePosition(1715, 65)
local oriAlpha = 1
--
local imagePath = "p1/restorebtn.png"
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
    layer.restoreBtn = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.restoreBtn = newImageRect(restorebtn, imageWidth, imageHeight )
    if layer.restoreBtn == nil then return end
    layer.restoreBtn.imagePath = imagePath
    layer.restoreBtn.x = mX
    layer.restoreBtn.y = mY
    layer.restoreBtn.alpha = oriAlpha
    layer.restoreBtn.oldAlpha = oriAlpha
    layer.restoreBtn.blendMode = ""
    layer.restoreBtn.oriX = layer.restoreBtn.x
    layer.restoreBtn.oriY = layer.restoreBtn.y
    layer.restoreBtn.oriXs = layer.restoreBtn.xScale
    layer.restoreBtn.oriYs = layer.restoreBtn.yScale
    layer.restoreBtn.name = "restoreBtn"
    sceneGroup.restoreBtn = layer.restoreBtn
          sceneGroup:insert( layer.restoreBtn)
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