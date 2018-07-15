-- Code created by Kwik - Copyright: kwiksher.com   2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _M = {}
local _K = require "Application"
local composer = require("composer")
---------------------
---------------------
local view          = require("components.store.view").new()
local storeFSM = require ( "components.store.storeFSM" ).getInstance()
---------------------
--
--
function _M:localPos(UI)
    local sceneGroup  = UI.scene.view
    local layer       = UI.layer
  -- Page properties
    view:init(sceneGroup, layer, storeFSM.fsm)
    end
--F
function _M:localVars(UI)
end
--
function _M:didShow(UI)
    storeFSM.view = view
  end
--
--
function _M:toDispose(UI)
    end
--
return _M