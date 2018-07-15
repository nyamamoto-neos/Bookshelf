-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local VO = {}
VO.field = "page03" --
---------------------
---------------------
local Const = require("extlib.const")
VO.const = Const:new{
	"page_common",
    		"bg_image_",
			"gotoPreviousBoo_button_but_PrevBook",
			"gotoNextBook_button_but_NextBook",
			"gotoTitle_button_but_title",
			"gotoTOC_button_but_TOC",
			"page_swipe_bg",
	}
---------------------
---------------------
VO.new = function(val)
	local vo = {
	page_common = val.page_common,
	    			bg_image_ = val.bg_image_,
					gotoPreviousBoo_button_but_PrevBook = val.gotoPreviousBoo_button_but_PrevBook,
					gotoNextBook_button_but_NextBook = val.gotoNextBook_button_but_NextBook,
					gotoTitle_button_but_title = val.gotoTitle_button_but_title,
					gotoTOC_button_but_TOC = val.gotoTOC_button_but_TOC,
					page_swipe_bg = val.page_swipe_bg,
		}
	--
	function vo:copyFrom(copyVO)
	end
	--
	function vo:valueOf()
		return baseDir.."/"..self.filename
	end
	--
	return vo
end
--
VO.equal = function(vo1, vo2)
	return vo1.valueOf() == vo2.valueOf()
end
--
return VO