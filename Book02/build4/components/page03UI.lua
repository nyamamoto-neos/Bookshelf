-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book02
--
local _Class   = {}
local layerUI  = require("components.kwik.layerUI")
local const    = require("vo.page03VO").const
local composer = require( "composer" )
local _K       = require("Application")
---------------------
---------------------
_Class.new = function(scene)
  local UI = layerUI.new()
    UI.scene     = scene
    UI.page      = "page03"
    UI.curPage   = 03
    -- All components on a table
    UI.layer     = {}
    -- All audio files on a table
    UI.allAudios = {}
    UI.allAudios.kAutoPlay = 0
    UI.tSearch   = nil
    UI.numPages = 3   -- number of pages in the project
    function UI:setLanguge()
      end
  --
  function UI:setVars()
        self:_vars("image",  const.bg_image_, false)
        self:_vars("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_vars("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_vars("button",  const.gotoTitle_button_but_title, false)
        self:_vars("button",  const.gotoTOC_button_but_TOC, false)
        self:_vars("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:create()
   self:_create("common",  const.page_common, false)
    self:setVars()
    self:setLanguge()
        self:_create("image",  const.bg_image_, false)
        self:_create("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_create("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_create("button",  const.gotoTitle_button_but_title, false)
        self:_create("button",  const.gotoTOC_button_but_TOC, false)
        self:_create("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:didShow(params)
    self:_didShow("common",  const.page_common, false)
        self:_didShow("image",  const.bg_image_, false)
        self:_didShow("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_didShow("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_didShow("button",  const.gotoTitle_button_but_title, false)
        self:_didShow("button",  const.gotoTOC_button_but_TOC, false)
        self:_didShow("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:didHide(params)
    self:_didHide("common",  const.page_common, false)
        self:_didHide("image",  const.bg_image_, false)
        self:_didHide("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_didHide("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_didHide("button",  const.gotoTitle_button_but_title, false)
        self:_didHide("button",  const.gotoTOC_button_but_TOC, false)
        self:_didHide("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:destroy(params)
    self:_destroy("common",  const.page_common)
        self:_destroy("image",  const.bg_image_, false)
        self:_destroy("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_destroy("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_destroy("button",  const.gotoTitle_button_but_title, false)
        self:_destroy("button",  const.gotoTOC_button_but_TOC, false)
        self:_destroy("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:touch(event)
      print("event.name: "..event.name)
  end
  function UI:resume(params)
        self:_resume("image",  const.bg_image_, false)
        self:_resume("button",  const.gotoPreviousBoo_button_but_PrevBook, false)
        self:_resume("button",  const.gotoNextBook_button_but_NextBook, false)
        self:_resume("button",  const.gotoTitle_button_but_title, false)
        self:_resume("button",  const.gotoTOC_button_but_TOC, false)
        self:_resume("swipe",  const.page_swipe_bg, false)
    end
  --
  return  UI
end
--
return _Class