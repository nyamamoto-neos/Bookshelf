-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020-- Version: -- Project: Book01--local Context = require "extlib.robotlegs.Context"local _Class = {}--function _Class:new()	local context = Context:new()	context.Router = {}	_Class.page01Context = require("contexts.page01Context")	_Class.page02Context = require("contexts.page02Context")	_Class.page03Context = require("contexts.page03Context")	_Class.page04Context = require("contexts.page04Context")	_Class.page05Context = require("contexts.page05Context")	_Class.page06Context = require("contexts.page06Context")--	function context:init()		------------------------------------------------------------		------------------------------------------------------------		    self.context01 = _Class.page01Context:new(self)	    self.context01:init()		    self.context02 = _Class.page02Context:new(self)	    self.context02:init()		    self.context03 = _Class.page03Context:new(self)	    self.context03:init()		    self.context04 = _Class.page04Context:new(self)	    self.context04:init()		    self.context05 = _Class.page05Context:new(self)	    self.context05:init()		    self.context06 = _Class.page06Context:new(self)	    self.context06:init()	-- app init command		self:mapCommand("app.Ads",          "commands.app.Ads")		self:mapCommand("app.bookmark",     "commands.app.bookmark")		-- self:mapCommand("app.coronaViewer", "commands.app.coronaViewer")		self:mapCommand("app.droidHWKey",   "commands.app.droidHWKey")		-- self:mapCommand("app.expDir",       "commands.app.expDir")		self:mapCommand("app.extCodes",     "commands.app.extCodes")		self:mapCommand("app.kwkVar",       "commands.app.kwkVar")		-- self:mapCommand("app.loadLib",      "commands.app.loadLib")		-- self:mapCommand("app.memoryCheck",  "commands.app.memoryCheck")		self:mapCommand("app.statusBar",    "commands.app.statusBar")		self:mapCommand("app.suspend",      "commands.app.suspend")		-- self:mapCommand("app.variables",    "commands.app.variables")		-- self:mapCommand("app.versionCheck", "commands.app.versionCheck")		--		self:mapMediator("Application", "mediators.ApplicationMediator")		--		Runtime:dispatchEvent({name="startup"})	end  --  function context:addInitializer(t)  	local t = require(t)  	for k,v in pairs(t) do self.Router[k] = v end  end  --	return contextend--return _Class