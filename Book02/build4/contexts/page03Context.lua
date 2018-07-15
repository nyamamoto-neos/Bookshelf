-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _Class = {}
--
function _Class:new(super)
	local context = super
	--
	function context:init()
------------------------------------------------------------
------------------------------------------------------------
				self:mapMediator("views.page03Scene", "mediators.page03Mediator")
		--
        _K = require("Application")
				self:mapCommand("page03.ext_but_TOC_code_442", _K.appDir.."commands.page03.ext_but_TOC_code_442")
				self:mapCommand("page03.gotoTOC_button_but_TOC", _K.appDir.."commands.page03.gotoTOC_button_but_TOC")
				self:mapCommand("page03.gotoTitle_button_but_title", _K.appDir.."commands.page03.gotoTitle_button_but_title")
				self:mapCommand("page03.ext_but_NextBook_code_761", _K.appDir.."commands.page03.ext_but_NextBook_code_761")
				self:mapCommand("page03.gotoNextBook_button_but_NextBook", _K.appDir.."commands.page03.gotoNextBook_button_but_NextBook")
				self:mapCommand("page03.ext_but_PrevBook_code_279", _K.appDir.."commands.page03.ext_but_PrevBook_code_279")
				self:mapCommand("page03.gotoPreviousBoo_button_but_PrevBook", _K.appDir.."commands.page03.gotoPreviousBoo_button_but_PrevBook")
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