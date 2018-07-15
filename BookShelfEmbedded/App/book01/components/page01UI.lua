-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
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
    UI.numPages = 6   -- number of pages in the project
    function UI:setLanguge()
      end
  --
  function UI:setVars()
        self:_vars("image",  const.bg_image_, false)
        self:_vars("dynamictext",  const.title_dynamictext_, false)
        self:_vars("var",  const.page_var_myVar, false)
        self:_vars("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:create()
   self:_create("common",  const.page_common, false)
    self:setVars()
    self:setLanguge()
        self:_create("image",  const.bg_image_, false)
        self:_create("dynamictext",  const.title_dynamictext_, false)
        self:_create("var",  const.page_var_myVar, false)
        self:_create("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:didShow(params)
    self:_didShow("common",  const.page_common, false)
        self:_didShow("image",  const.bg_image_, false)
        self:_didShow("dynamictext",  const.title_dynamictext_, false)
        self:_didShow("var",  const.page_var_myVar, false)
        self:_didShow("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:didHide(params)
    self:_didHide("common",  const.page_common, false)
        self:_didHide("image",  const.bg_image_, false)
        self:_didHide("dynamictext",  const.title_dynamictext_, false)
        self:_didHide("var",  const.page_var_myVar, false)
        self:_didHide("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:destroy(params)
    self:_destroy("common",  const.page_common)
        self:_destroy("image",  const.bg_image_, false)
        self:_destroy("dynamictext",  const.title_dynamictext_, false)
        self:_destroy("var",  const.page_var_myVar, false)
        self:_destroy("swipe",  const.page_swipe_bg, false)
    end
  --
  function UI:touch(event)
      print("event.name: "..event.name)
  end
  function UI:resume(params)
        self:_resume("image",  const.bg_image_, false)
        self:_resume("dynamictext",  const.title_dynamictext_, false)
        self:_resume("var",  const.page_var_myVar, false)
        self:_resume("swipe",  const.page_swipe_bg, false)
    end
  --
  return  UI
end
--
return _Class