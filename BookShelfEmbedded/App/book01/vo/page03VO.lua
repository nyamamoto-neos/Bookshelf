-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local VO = {}
VO.field = "page03" --
---------------------
---------------------
local Const = require("extlib.const")
VO.const = Const:new{
	"page_common",
    		"bg_image_",
			"Shape1_image_",
			"mask_image_",
			"page_swipe_bg",
	}
---------------------
---------------------
VO.new = function(val)
	local vo = {
	page_common = val.page_common,
	    			bg_image_ = val.bg_image_,
					Shape1_image_ = val.Shape1_image_,
					mask_image_ = val.mask_image_,
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