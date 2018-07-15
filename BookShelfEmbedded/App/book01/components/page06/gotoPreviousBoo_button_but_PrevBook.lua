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
local imageWidth             = 874/4
local imageHeight            = 81/4
local mX, mY                 = _K.ultimatePosition(1401, 680)
local oriAlpha = 1
--
local imagePath = "p6/gotopreviousboo.png"
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
      if layer.gotoPreviousBoo == nil then return end
    _M:createTabButFunction(UI, {obj=layer.gotoPreviousBoo, btaps=1, eventName="gotoPreviousBoo_button_but_PrevBook"})
  end
--
function _M:toDispose(UI)
  local layer      = UI.layer
  local sceneGroup = UI.scene.view
      if layer.gotoPreviousBoo == nil then return end
    _M:removeTabButFunction(UI, {obj=layer.gotoPreviousBoo, eventName="gotoPreviousBoo_button_but_PrevBook"})
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
            layer.gotoPreviousBoo = display.newImageRect( _K.imgDir.. imagePath, _K.systemDir, imageWidth, imageHeight )
    if layer.gotoPreviousBoo == nil then return end
      layer.gotoPreviousBoo.x        = mX
      layer.gotoPreviousBoo.y        = mY
      layer.gotoPreviousBoo.alpha    = oriAlpha
      layer.gotoPreviousBoo.oldAlpha = oriAlpha
      layer.gotoPreviousBoo.oriX  = layer.gotoPreviousBoo.x
      layer.gotoPreviousBoo.oriY  = layer.gotoPreviousBoo.y
      layer.gotoPreviousBoo.oriXs = layer.gotoPreviousBoo.xScale
      layer.gotoPreviousBoo.oriYs = layer.gotoPreviousBoo.yScale
      layer.gotoPreviousBoo.name  = "gotoPreviousBoo"
      sceneGroup.gotoPreviousBoo  = layer.gotoPreviousBoo
      sceneGroup:insert(layer.gotoPreviousBoo)
    end
--
return _M