-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _M = {}
--
local _K = require "Application"
--
local imageWidth             = 737/4
local imageHeight            = 48
local mX, mY                 = _K.ultimatePosition(967, 188 + 0 )
local elFontSize = 200/4
local oriAlpha = 1
--
function _M:localVars(UI)
  end
--
function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      local mVar = UI.myVar
     local options = { text = mVar, x = mX + imageWidth/2, y = mY, fontSize = elFontSize, font = native.systemFont, align = "left" }
  layer.title = display.newText(options)
  if layer.title == nil then return end
  layer.title:setFillColor( 0.0078431372549, 0.0078431372549, 0.0078431372549 )
  layer.title.anchorX = 0.5
  layer.title.anchorY = 0.25
  _K.repositionAnchor(layer.title,0.5,0);
  layer.title.oriX     = layer.title.x
  layer.title.oriY     = layer.title.y
  layer.title.oriXs    = layer.title.xScale
  layer.title.oriYs    = layer.title.yScale
  layer.title.alpha    = oriAlpha
  layer.title.oldAlpha = oriAlpha
  sceneGroup:insert( layer.title)
  sceneGroup.title = layer.title
  end
--
return _M