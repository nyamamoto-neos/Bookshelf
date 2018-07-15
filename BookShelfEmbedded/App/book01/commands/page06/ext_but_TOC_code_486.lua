-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01,
--
local ActionCommand = {}
local _K            = require "Application"
--
function ActionCommand:new()
	local command = {}
	--
	function command:execute(params)
		local UI         = params.UI
		local sceneGroup = UI.scene.view
		local layer      = UI.layer
		local phase     = params.event.phase
		local event     = params.event
							local ui = require("components.store.UI")
ui.gotoSceneBook("TOC")
			end
		return command
end
--
return ActionCommand