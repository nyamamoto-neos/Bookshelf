-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _M = {}
local Var = require("components.kwik.vars")
local _K   = require("Application")
---------------------
-- External libraries
--
function _M:localPos(UI)
    local sceneGroup  = UI.scene.view
    local layer       = UI.layer
  end
--
function _M:didShow(UI)
  end
--
function _M:toDispose(UI)
                  Var:saveKwikVars({"myVar", UI.myVar })
      end
--
function _M:localVars(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
                UI.myVar = "book02"
               -- Check if variable has a pre-saved content
         if Var:kwkVarCheck("myVar") ~= nil then
            UI.myVar = Var:kwkVarCheck("myVar")
         end
      end
--
return _M