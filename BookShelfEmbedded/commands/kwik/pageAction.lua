-- Code created by Kwik - Copyright: kwiksher.com {{year}}
-- Version: {{vers}}
-- Project: {{ProjName}}
--
local _M = {}
local _K = require("Application")
local composer = require("composer")
local Navigation = require("extlib.kNavi")

function _M:autoPlay(curPage)
  local model = require("App.".._G.appName..".model")
  if model.isIAP then
    local ui = require("components.store.UI")
    ui.currentPage = curPage
  end
  if nil~= composer.getScene("App.".._G.appName..".views.page0"..(curPage+1).."Scene" ) then
    	composer.removeScene("App.".._G.appName.. ".views.page0"..(curPage+1).."Scene"  , true)
   end
   composer.gotoScene("App.".._G.appName.. ".views.page0"..(curPage+1).."Scene"  )
end
--
function _M:showHideNavigation()
  if (_K.kNavig.alpha == 0) then
     Navigation.show()
  else
     Navigation.hide()
  end
end
--
function _M:reloadPage(canvas)
	if canvas then
   _K.reloadCanvas = 0
	end
	composer.gotoScene("extlib.page_reload")
end
--
function _M:gotoPage(pnum, ptrans, delay, _time)
  local model = require("App.".._G.appName..".model")
  if model.isIAP then
     local ui = require("components.store.UI")
     ui.currentPage = pnum-1
  end
  local myClosure_switch= function()
      if nil~= composer.getScene("App.".._G.appName..".views.page0"..pnum.."Scene") then
      	composer.removeScene("App.".._G.appName..".views.page0"..pnum.."Scene", true)
      end
		if ptrans and ptrans ~="" then
       composer.gotoScene("App.".._G.appName.. ".views.page0"..pnum.."Scene", { effect = ptrans, time=_time} )
		else
       composer.gotoScene("App.".._G.appName.. ".views.page0"..pnum.."Scene" )
		end
  end
  if delay > 0 then
  _K.timerStash.pageAction = timer.performWithDelay(delay, myClosure_switch, 1)
  else
    myClosure_switch()
  end
end
--
return _M