-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018
-- Version: 4.1.0
-- Project: BookTOC
--
local PageViewMediator = {}
--
function PageViewMediator:new()
  local mediator = {}
  --
  function mediator:onRegister()
    local view = self.viewInstance
    -- Scene
    view:addEventListener("hide", self)
        view:addEventListener("action_act_buy", self)
    end
  --
  function mediator:onRemove()
    local view = self.viewInstance
        view:removeEventListener("action_act_buy", self)
    end
  --
  function mediator:hide(event)
    Runtime:dispatchEvent({name=".hide", event=event, UI = self.viewInstance.pageUI})
  end
    function mediator:action_act_buy(event)
    Runtime:dispatchEvent({name="page01.action_act_buy", event=event.parent or event, UI = self.viewInstance.pageUI})
  end
  --
  return mediator
end
--
return PageViewMediator