-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _Class = {}
--
function _Class:new(super)
	local context = super
	--
	function context:init()
------------------------------------------------------------
------------------------------------------------------------
				self:mapMediator("views.page06Scene", "mediators.page06Mediator")
		--
        _K = require("Application")
				self:mapCommand("page06.ext_but_TOC_code_486", _K.appDir.."commands.page06.ext_but_TOC_code_486")
				self:mapCommand("page06.gotoTOC_button_but_TOC", _K.appDir.."commands.page06.gotoTOC_button_but_TOC")
				self:mapCommand("page06.gotoTitle_button_but_title", _K.appDir.."commands.page06.gotoTitle_button_but_title")
				self:mapCommand("page06.ext_but_NextBook_code_014", _K.appDir.."commands.page06.ext_but_NextBook_code_014")
				self:mapCommand("page06.gotoNextBook_button_but_NextBook", _K.appDir.."commands.page06.gotoNextBook_button_but_NextBook")
				self:mapCommand("page06.ext_but_PrevBook_code_273", _K.appDir.."commands.page06.ext_but_PrevBook_code_273")
				self:mapCommand("page06.gotoPreviousBoo_button_but_PrevBook", _K.appDir.."commands.page06.gotoPreviousBoo_button_but_PrevBook")
		--
	end
  --
  function context:addInitializer(t)
  	local t = require(t)
  	for k,v in pairs(t) do self.Router[k] = v end
  end
  --
	return context
end
--
return _Class