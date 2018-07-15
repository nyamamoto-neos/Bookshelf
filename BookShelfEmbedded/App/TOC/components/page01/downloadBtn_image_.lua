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
local imageWidth             = 163/4
local imageHeight            = 29/4
local mX, mY                 = _K.ultimatePosition(1065, 682)
local oriAlpha = 1
--
local imagePath = "p1/downloadbtn.png"
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
    layer.downloadBtn = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.downloadBtn = newImageRect(downloadbtn, imageWidth, imageHeight )
    if layer.downloadBtn == nil then return end
    layer.downloadBtn.imagePath = imagePath
    layer.downloadBtn.x = mX
    layer.downloadBtn.y = mY
    layer.downloadBtn.alpha = oriAlpha
    layer.downloadBtn.oldAlpha = oriAlpha
    layer.downloadBtn.blendMode = ""
    layer.downloadBtn.oriX = layer.downloadBtn.x
    layer.downloadBtn.oriY = layer.downloadBtn.y
    layer.downloadBtn.oriXs = layer.downloadBtn.xScale
    layer.downloadBtn.oriYs = layer.downloadBtn.yScale
    layer.downloadBtn.name = "downloadBtn"
    sceneGroup.downloadBtn = layer.downloadBtn
          sceneGroup:insert( layer.downloadBtn)
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