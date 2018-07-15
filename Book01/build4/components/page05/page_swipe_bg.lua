-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: Book01
--
local _M = {}
--
local _K = require "Application"
local page_curl  = require("extlib.page_curl")
-- local ui     = require("components.store.UI")
-----------------------------------------------
-- local _BackgroundLayerName = "background.jpg"
-----------------------------------------------
local flip_audio = false
local laserSound
local laserChannel
--
if flip_audio then
  laserSound = audio.loadSound(_K.audioDir.."page-flip-02.wav", _K.systemDir)
end
------------------------------------------------
local debug = false
------------------------------------------------
local bgW, bgH = 1920/4, 1280/4                --  layer.bg.width, layer.bg.height
local pgX, pgY = _K.ultimatePosition(960, 640) --  layer.bg.x, layer.bg.y
local curlWidth = 400/4
--
local pageNextUI, pagePrevUI
local passed_threshold = false
-----------------------------------------------
function _M:didShow(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
  local curPage     = UI.curPage
  local numPages    = UI.numPages
  local back, next, prev
  local prevPage, nextPage
  nextPage = curPage + 1
  if nextPage > numPages then nextPage = curPage end
  prevPage = curPage - 1
  if prevPage < 1 then prevPage = 1 end
if layer.bg == nil then return end
  local W, H = layer.bg.width, layer.bg.height
  local function Grabbed(event)
    local curl = event.target
    curl.alpha = 1
    if event.dir == "right" then
      if next == nil and curPage~=nextPage then
-- next = display.newImageRect( _K.imgDir.. "p"..nextPage.."/".._BackgroundLayerName, _K.systemDir, bgW, bgH )
        -- next.x = pgX
        -- next.y = pgY
        -- sceneGroup:insert(next)
        -- next:toFront()
        local scene ={view=display.newGroup()}
        pageNextUI    = require("components.page0"..nextPage.."UI").new(scene)
        pageNextUI.dummy   = nextPage
        pageNextUI:create()
        next = scene.view
        sceneGroup:insert(next)
        next:toFront()
end
    else
      if prev == nil and curPage ~= prevPage then
-- prev = display.newImageRect( _K.imgDir.."p"..prevPage.."/".._BackgroundLayerName, _K.systemDir,bgW, bgH )
        -- prev.x = pgX
        -- prev.y = pgY
        -- sceneGroup:insert(prev)
        -- prev:toFront()
        local scene ={view=display.newGroup()}
        pagePrevUI    = require("components.page0"..prevPage.."UI").new(scene)
        pagePrevUI.dummy   = prevPage
        pagePrevUI:create()
        prev = scene.view
        sceneGroup:insert(prev)
        prev:toFront()
end
    end
    back:toFront()
  end
  --
  local function Released(event)
    back:toBack()
    back.alpha = 0.1
    if pagePrevUI then
       pagePrevUI:didHide()
       pagePrevUI = nil
    end
    if pageNextUI then
        pageNextUI:didHide()
        pageNextUI = nil
    end
    if next then
      next:removeSelf()
      next = nil
    end
    if prev then
      prev:removeSelf()
      prev = nil
    end
  end
  --
  --
  local function Moved (event)
    local curl = event.target
    --
    local function GoNext()
       if event.dir == "right" and _K.kBidi == false then
          wPage = curPage + 1
          if wPage > numPages then wPage = curPage end
          options = { effect = "fromRight"}
       elseif event.dir == "right" and _K.kBidi == true then
          wPage = curPage - 1
          if wPage < 1 then wPage = 1 end
          options = { effect = "fromLeft"}
       elseif event.dir == "left" and _K.kBidi == true then
          wPage = curPage + 1
          if wPage > numPages then wPage = curPage end
          options = { effect = "fromRight"}
       elseif event.dir == "left" and _K.kBidi == false then
          wPage = curPage - 1
          if wPage < 1 then wPage = 1 end
          options = { effect = "fromLeft"}
       end
           local ui           = require("components.store.UI")
       if tonumber(wPage) ~= tonumber(curPage)  then
          if pagePrevUI then
             pagePrevUI:didHide()
             pagePrevUI = nil
          end
          if pageNextUI then
              pageNextUI:didHide()
              pageNextUI = nil
          end
          if ui.setDir(wPage) then
            ui.showView(curPage, wPage, options)
          end
       else
          ui.gotoTOC(options)
       end
       passed_threshold = false
    end
if event.dir == "right" and not passed_threshold then
      if curl.edge_x < .45 then
        passed_threshold = true
        if flip_audio then
          laserChannel = audio.play( laserSound )
        end
        transition.to(curl, {edge_x=0, time=100, transition=easing.inOutSine, onComplete = GoNext})
      end
    else
      if curl.edge_x > .55 and not passed_threshold then
        passed_threshold = true
        if flip_audio then
          laserChannel = audio.play( laserSound )
        end
        transition.to(curl, {edge_x=1, time=100, transition=easing.inOutSine, onComplete = GoNext})
      end
    end
  end
  --
  if back == nil then
    local function saveWithDelay()
      if sceneGroup then
      display.save( sceneGroup, { filename="entireGroup.jpg", baseDir=system.TemporaryDirectory, captureOffscreenArea=false, backgroundColor={0,0,0,0} } )
      back = page_curl.NewPageCurlWidget{width =bgW, height=bgH, size = curlWidth}
      -- back:SetImage(_K.imgDir.."p"..curPage.."/".._BackgroundLayerName)
      back:SetImage("entireGroup.jpg", {dir=system.TemporaryDirectory})
      back.x = display.contentCenterX - bgW/2
      back.y  = display.contentCenterY - bgH/2
      back:SetTouchSides("left_and_right")
      back:addEventListener("page_grabbed", Grabbed)
      back:addEventListener("page_dragged", Moved)
      back:addEventListener("page_released", Released)
      sceneGroup:insert(back)
      back:toBack()
      back.alpha = 0.1
      layer.pageCurl = back
      end
    end
    timer.performWithDelay( 100, saveWithDelay )
    -- debug mode
    if debug then
      ---[[
      local regions = back:GetGrabRegions()
      for _, region in pairs(regions) do
        local rect = display.newRoundedRect(back.parent, region.x, region.y, region.width, region.height, 12)
        rect:setFillColor(.3, .3)
        rect:setStrokeColor(.4, .5, .2)
        rect.strokeWidth = 10
        sceneGroup:insert(rect)
      end
    end
    --]]
  end
  -----------------
  -----------------
  UI.autoPlayCurl = function(act_autoPlay)
    if UI.curPage < UI.numPages then
      back.angle_radians = math.pi/10
      back.edge_x, back.edge_y =  0.9, 0.5
      Grabbed({target=back, dir="right"})
      if flip_audio then
          laserChannel = audio.play( laserSound )
       end
      transition.to(back, {edge_x=0, time=1000, transition=easing.inOutSine, onComplete = act_autoPlay})
    end
  end
  -- layer.bg.alpha = 1
end
--
function _M:toDispose()
  if laserSound and laserChannel then
    audio.stop( laserChannel)
  end
end
--
function _M:toDestroy(UI)
end
--
return _M