-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020-- Version: -- Project: Book01,--local ActionCommand = {}local _K            = require "Application"--function ActionCommand:new()	local command = {}	--	function command:execute(params)		local UI         = params.UI		local sceneGroup = UI.scene.view		local layer      = UI.layer		local phase     = params.event.phase		local event     = params.event			end		return commandend--return ActionCommand