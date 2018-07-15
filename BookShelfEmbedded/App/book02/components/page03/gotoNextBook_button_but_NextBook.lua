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
local imageWidth             = 701/4
local imageHeight            = 81/4
local mX, mY                 = _K.ultimatePosition(1314, 303)
local oriAlpha = 1
--
local imagePath = "p3/gotonextbook.png"
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
      if layer.gotoNextBook == nil then return end
    _M:createTabButFunction(UI, {obj=layer.gotoNextBook, btaps=1, eventName="gotoNextBook_button_but_NextBook"})
  end
--
function _M:toDispose(UI)
  local layer      = UI.layer
  local sceneGroup = UI.scene.view
      if layer.gotoNextBook == nil then return end
    _M:removeTabButFunction(UI, {obj=layer.gotoNextBook, eventName="gotoNextBook_button_but_NextBook"})
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
            layer.gotoNextBook = display.newImageRect( _K.imgDir.. imagePath, _K.systemDir, imageWidth, imageHeight )
    if layer.gotoNextBook == nil then return end
      layer.gotoNextBook.x        = mX
      layer.gotoNextBook.y        = mY
      layer.gotoNextBook.alpha    = oriAlpha
      layer.gotoNextBook.oldAlpha = oriAlpha
      layer.gotoNextBook.oriX  = layer.gotoNextBook.x
      layer.gotoNextBook.oriY  = layer.gotoNextBook.y
      layer.gotoNextBook.oriXs = layer.gotoNextBook.xScale
      layer.gotoNextBook.oriYs = layer.gotoNextBook.yScale
      layer.gotoNextBook.name  = "gotoNextBook"
      sceneGroup.gotoNextBook  = layer.gotoNextBook
      sceneGroup:insert(layer.gotoNextBook)
    end
--
return _M