-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020-- Version: -- Project: Book02--local VO = {}VO.field = "page02" --------------------------------------------local Const = require("extlib.const")VO.const = Const:new{	"page_common",    		"page_var_myVar",    		"bg_image_",			"Shape1_image_",			"Shape2_image_",			"Text1_dynamictext_",			"page_swipe_bg",	}------------------------------------------VO.new = function(val)	local vo = {	page_common = val.page_common,					page_var_myVar = val.page_var_myVar,					bg_image_ = val.bg_image_,					Shape1_image_ = val.Shape1_image_,					Shape2_image_ = val.Shape2_image_,					Text1_dynamictext_ = val.Text1_dynamictext_,					page_swipe_bg = val.page_swipe_bg,		}	--	function vo:copyFrom(copyVO)	end	--	function vo:valueOf()		return baseDir.."/"..self.filename	end	--	return voend--VO.equal = function(vo1, vo2)	return vo1.valueOf() == vo2.valueOf()end--return VO