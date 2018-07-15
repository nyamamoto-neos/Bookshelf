-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local VO = {}
VO.field = "page01" --
---------------------
---------------------
local Const = require("extlib.const")
VO.const = Const:new{
	"page_common",
    		"bg_image_",
			"rect12_image_",
			"rect11_image_",
			"rect10_image_",
			"rect9_image_",
			"rect8_image_",
			"rect7_image_",
			"rect6_image_",
			"rect5_image_",
			"rect4_image_",
			"rect3_image_",
			"restoreBtn_image_",
			"purchaseBtn_image_",
			"savingTxt_image_",
			"savedBtn_image_",
			"downloadBtn_image_",
			"book02Icon_image_",
			"book01Icon_image_",
			"page_IAP_",
	}
---------------------
---------------------
VO.new = function(val)
	local vo = {
	page_common = val.page_common,
	    			bg_image_ = val.bg_image_,
					rect12_image_ = val.rect12_image_,
					rect11_image_ = val.rect11_image_,
					rect10_image_ = val.rect10_image_,
					rect9_image_ = val.rect9_image_,
					rect8_image_ = val.rect8_image_,
					rect7_image_ = val.rect7_image_,
					rect6_image_ = val.rect6_image_,
					rect5_image_ = val.rect5_image_,
					rect4_image_ = val.rect4_image_,
					rect3_image_ = val.rect3_image_,
					restoreBtn_image_ = val.restoreBtn_image_,
					purchaseBtn_image_ = val.purchaseBtn_image_,
					savingTxt_image_ = val.savingTxt_image_,
					savedBtn_image_ = val.savedBtn_image_,
					downloadBtn_image_ = val.downloadBtn_image_,
					book02Icon_image_ = val.book02Icon_image_,
					book01Icon_image_ = val.book01Icon_image_,
					page_IAP_ = val.page_IAP_,
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