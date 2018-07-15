-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
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
local imageWidth             = 652/4
local imageHeight            = 103/4
local mX, mY                 = _K.ultimatePosition(590, 442)
local oriAlpha = 1
--
local imagePath = "p3/gototitle.png"
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
      if layer.gotoTitle == nil then return end
    _M:createTabButFunction(UI, {obj=layer.gotoTitle, btaps=1, eventName="gotoTitle_button_but_title"})
  end
--
function _M:toDispose(UI)
  local layer      = UI.layer
  local sceneGroup = UI.scene.view
      if layer.gotoTitle == nil then return end
    _M:removeTabButFunction(UI, {obj=layer.gotoTitle, eventName="gotoTitle_button_but_title"})
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
            layer.gotoTitle = display.newImageRect( _K.imgDir.. imagePath, _K.systemDir, imageWidth, imageHeight )
    if layer.gotoTitle == nil then return end
      layer.gotoTitle.x        = mX
      layer.gotoTitle.y        = mY
      layer.gotoTitle.alpha    = oriAlpha
      layer.gotoTitle.oldAlpha = oriAlpha
      layer.gotoTitle.oriX  = layer.gotoTitle.x
      layer.gotoTitle.oriY  = layer.gotoTitle.y
      layer.gotoTitle.oriXs = layer.gotoTitle.xScale
      layer.gotoTitle.oriYs = layer.gotoTitle.yScale
      layer.gotoTitle.name  = "gotoTitle"
      sceneGroup.gotoTitle  = layer.gotoTitle
      sceneGroup:insert(layer.gotoTitle)
    end
--
return _M