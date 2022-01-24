-- Code created by Kwik - Copyright: kwiksher.com 2016
-- Version: 4.0.2 01
-- Project: HelloWorld
--
local _Command = {}
-----------------------------
-----------------------------
function _Command:new()
	local command = {}
	--
	function command:execute(params)
		local event         = params.event
		if event=="init" then
			-- Adding external code
			end
	end
	return command
end
--
return _Command