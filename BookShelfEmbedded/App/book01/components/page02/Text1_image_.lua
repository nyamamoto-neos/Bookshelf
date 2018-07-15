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
local imageWidth             = 600/4
local imageHeight            = 155/4
local mX, mY                 = _K.ultimatePosition(419, 1018)
local oriAlpha = 1
--
local imagePath = "p2/text1.png"
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
    layer.Text1 = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.Text1 = newImageRect(text1, imageWidth, imageHeight )
    if layer.Text1 == nil then return end
    layer.Text1.imagePath = imagePath
    layer.Text1.x = mX
    layer.Text1.y = mY
    layer.Text1.alpha = oriAlpha
    layer.Text1.oldAlpha = oriAlpha
    layer.Text1.blendMode = ""
    layer.Text1.oriX = layer.Text1.x
    layer.Text1.oriY = layer.Text1.y
    layer.Text1.oriXs = layer.Text1.xScale
    layer.Text1.oriYs = layer.Text1.yScale
    layer.Text1.name = "Text1"
    sceneGroup.Text1 = layer.Text1
          sceneGroup:insert( layer.Text1)
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