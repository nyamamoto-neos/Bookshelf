-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _M = require("components.kwik.tabButFunction").new(scene)
--
local widget = require("widget")
local _K = require "Application"
--
-- scene, layer and sceneGroup should be INPUT
-- tab should be INPUT
-- tabja["witch"] = {"p2_witch_ja.png", 180, 262, 550, 581, 1}
--
-- UI.tSearch = tabja
--
local imageWidth             = 427/4
local imageHeight            = 78/4
local mX, mY                 = _K.ultimatePosition(477, 166)
local oriAlpha = 1
--
local imagePath = "p6/gototoc.png"
function _M:localVars (UI)
   self:buttonVars(UI)
end
--
function _M:localPos(UI)
  self:buttonLocal(UI)
end
--
function _M:didShow(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
  local self       = UI.scene
  --
      if layer.gotoTOC == nil then return end
    _M:createTabButFunction(UI, {obj=layer.gotoTOC, btaps=1, eventName="gotoTOC_button_but_TOC"})
  end
--
function _M:toDispose(UI)
  local layer      = UI.layer
  local sceneGroup = UI.scene.view
      if layer.gotoTOC == nil then return end
    _M:removeTabButFunction(UI, {obj=layer.gotoTOC, eventName="gotoTOC_button_but_TOC"})
  end
--
function _M:toDestroy(UI)
end
--
function _M:buttonVars(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
  end
--
function _M:buttonLocal(UI)
  local sceneGroup = UI.scene.view
  local layer      = UI.layer
            layer.gotoTOC = display.newImageRect( _K.imgDir.. imagePath, _K.systemDir, imageWidth, imageHeight )
    if layer.gotoTOC == nil then return end
      layer.gotoTOC.x        = mX
      layer.gotoTOC.y        = mY
      layer.gotoTOC.alpha    = oriAlpha
      layer.gotoTOC.oldAlpha = oriAlpha
      layer.gotoTOC.oriX  = layer.gotoTOC.x
      layer.gotoTOC.oriY  = layer.gotoTOC.y
      layer.gotoTOC.oriXs = layer.gotoTOC.xScale
      layer.gotoTOC.oriYs = layer.gotoTOC.yScale
      layer.gotoTOC.name  = "gotoTOC"
      sceneGroup.gotoTOC  = layer.gotoTOC
      sceneGroup:insert(layer.gotoTOC)
    end
--
return _M