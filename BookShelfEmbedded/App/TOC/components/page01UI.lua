-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local _Class   = {}
local layerUI  = require("components.kwik.layerUI")
local const    = require("vo.page01VO").const
local composer = require( "composer" )
local _K       = require("Application")
---------------------
---------------------
_Class.new = function(scene)
  local UI = layerUI.new()
    UI.scene     = scene
    UI.page      = "page01"
    UI.curPage   = 01
    -- All components on a table
    UI.layer     = {}
    -- All audio files on a table
    UI.allAudios = {}
    UI.allAudios.kAutoPlay = 0
    UI.tSearch   = nil
                UI.taben = {}
      UI.tSearch   = nil
    UI.numPages = 2   -- number of pages in the project
    function UI:setLanguge()
            if _K.lang == "" then _K.lang = "en" end
              -- Language switch
        if (_K.lang=="en") then
          self.tSearch = self.taben
        end
      end
  --
  function UI:setVars()
        self:_vars("image",  const.bg_image_, false)
        self:_vars("image",  const.rect12_image_, false)
        self:_vars("image",  const.rect11_image_, false)
        self:_vars("image",  const.rect10_image_, false)
        self:_vars("image",  const.rect9_image_, false)
        self:_vars("image",  const.rect8_image_, false)
        self:_vars("image",  const.rect7_image_, false)
        self:_vars("image",  const.rect6_image_, false)
        self:_vars("image",  const.rect5_image_, false)
        self:_vars("image",  const.rect4_image_, false)
        self:_vars("image",  const.rect3_image_, false)
        self:_vars("image",  const.restoreBtn_image_, false)
        self:_vars("image",  const.purchaseBtn_image_, false)
        self:_vars("image",  const.savingTxt_image_, false)
        self:_vars("image",  const.savedBtn_image_, false)
        self:_vars("image",  const.downloadBtn_image_, false)
        self:_vars("image",  const.book02Icon_image_, false)
        self:_vars("image",  const.book01Icon_image_, false)
        self:_vars("IAP",  const.page_IAP_, false)
    end
  --
  function UI:create()
   self:_create("common",  const.page_common, false)
    self:setVars()
    self:setLanguge()
        self:_create("image",  const.bg_image_, false)
        self:_create("image",  const.rect12_image_, false)
        self:_create("image",  const.rect11_image_, false)
        self:_create("image",  const.rect10_image_, false)
        self:_create("image",  const.rect9_image_, false)
        self:_create("image",  const.rect8_image_, false)
        self:_create("image",  const.rect7_image_, false)
        self:_create("image",  const.rect6_image_, false)
        self:_create("image",  const.rect5_image_, false)
        self:_create("image",  const.rect4_image_, false)
        self:_create("image",  const.rect3_image_, false)
        self:_create("image",  const.restoreBtn_image_, false)
        self:_create("image",  const.purchaseBtn_image_, false)
        self:_create("image",  const.savingTxt_image_, false)
        self:_create("image",  const.savedBtn_image_, false)
        self:_create("image",  const.downloadBtn_image_, false)
        self:_create("image",  const.book02Icon_image_, false)
        self:_create("image",  const.book01Icon_image_, false)
        self:_create("IAP",  const.page_IAP_, false)
    end
  --
  function UI:didShow(params)
    self:_didShow("common",  const.page_common, false)
        self:_didShow("image",  const.bg_image_, false)
        self:_didShow("image",  const.rect12_image_, false)
        self:_didShow("image",  const.rect11_image_, false)
        self:_didShow("image",  const.rect10_image_, false)
        self:_didShow("image",  const.rect9_image_, false)
        self:_didShow("image",  const.rect8_image_, false)
        self:_didShow("image",  const.rect7_image_, false)
        self:_didShow("image",  const.rect6_image_, false)
        self:_didShow("image",  const.rect5_image_, false)
        self:_didShow("image",  const.rect4_image_, false)
        self:_didShow("image",  const.rect3_image_, false)
        self:_didShow("image",  const.restoreBtn_image_, false)
        self:_didShow("image",  const.purchaseBtn_image_, false)
        self:_didShow("image",  const.savingTxt_image_, false)
        self:_didShow("image",  const.savedBtn_image_, false)
        self:_didShow("image",  const.downloadBtn_image_, false)
        self:_didShow("image",  const.book02Icon_image_, false)
        self:_didShow("image",  const.book01Icon_image_, false)
        self:_didShow("IAP",  const.page_IAP_, false)
    end
  --
  function UI:didHide(params)
    self:_didHide("common",  const.page_common, false)
        self:_didHide("image",  const.bg_image_, false)
        self:_didHide("image",  const.rect12_image_, false)
        self:_didHide("image",  const.rect11_image_, false)
        self:_didHide("image",  const.rect10_image_, false)
        self:_didHide("image",  const.rect9_image_, false)
        self:_didHide("image",  const.rect8_image_, false)
        self:_didHide("image",  const.rect7_image_, false)
        self:_didHide("image",  const.rect6_image_, false)
        self:_didHide("image",  const.rect5_image_, false)
        self:_didHide("image",  const.rect4_image_, false)
        self:_didHide("image",  const.rect3_image_, false)
        self:_didHide("image",  const.restoreBtn_image_, false)
        self:_didHide("image",  const.purchaseBtn_image_, false)
        self:_didHide("image",  const.savingTxt_image_, false)
        self:_didHide("image",  const.savedBtn_image_, false)
        self:_didHide("image",  const.downloadBtn_image_, false)
        self:_didHide("image",  const.book02Icon_image_, false)
        self:_didHide("image",  const.book01Icon_image_, false)
        self:_didHide("IAP",  const.page_IAP_, false)
    end
  --
  function UI:destroy(params)
    self:_destroy("common",  const.page_common)
        self:_destroy("image",  const.bg_image_, false)
        self:_destroy("image",  const.rect12_image_, false)
        self:_destroy("image",  const.rect11_image_, false)
        self:_destroy("image",  const.rect10_image_, false)
        self:_destroy("image",  const.rect9_image_, false)
        self:_destroy("image",  const.rect8_image_, false)
        self:_destroy("image",  const.rect7_image_, false)
        self:_destroy("image",  const.rect6_image_, false)
        self:_destroy("image",  const.rect5_image_, false)
        self:_destroy("image",  const.rect4_image_, false)
        self:_destroy("image",  const.rect3_image_, false)
        self:_destroy("image",  const.restoreBtn_image_, false)
        self:_destroy("image",  const.purchaseBtn_image_, false)
        self:_destroy("image",  const.savingTxt_image_, false)
        self:_destroy("image",  const.savedBtn_image_, false)
        self:_destroy("image",  const.downloadBtn_image_, false)
        self:_destroy("image",  const.book02Icon_image_, false)
        self:_destroy("image",  const.book01Icon_image_, false)
        self:_destroy("IAP",  const.page_IAP_, false)
    end
  --
  function UI:touch(event)
      print("event.name: "..event.name)
  end
  function UI:resume(params)
        self:_resume("image",  const.bg_image_, false)
        self:_resume("image",  const.rect12_image_, false)
        self:_resume("image",  const.rect11_image_, false)
        self:_resume("image",  const.rect10_image_, false)
        self:_resume("image",  const.rect9_image_, false)
        self:_resume("image",  const.rect8_image_, false)
        self:_resume("image",  const.rect7_image_, false)
        self:_resume("image",  const.rect6_image_, false)
        self:_resume("image",  const.rect5_image_, false)
        self:_resume("image",  const.rect4_image_, false)
        self:_resume("image",  const.rect3_image_, false)
        self:_resume("image",  const.restoreBtn_image_, false)
        self:_resume("image",  const.purchaseBtn_image_, false)
        self:_resume("image",  const.savingTxt_image_, false)
        self:_resume("image",  const.savedBtn_image_, false)
        self:_resume("image",  const.downloadBtn_image_, false)
        self:_resume("image",  const.book02Icon_image_, false)
        self:_resume("image",  const.book01Icon_image_, false)
        self:_resume("IAP",  const.page_IAP_, false)
    end
  --
  return  UI
end
--
return _Class