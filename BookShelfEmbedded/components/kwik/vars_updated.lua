-- Code created by Kwik - Copyright: kwiksher.com {{year}}
-- Version: {{vers}}
-- Project: {{ProjName}}
--
local _Class = {}
local json   = require("json")
--
-- Json code for external variable loading
local jsonFile = function(filename )
   local path = system.pathForFile(filename, system.DocumentsDirectory )
   local contents = ""
   local file = io.open( path, "r" )
   if file then
      contents = file:read("*a")
      io.close(file)
      file = nil
   end
   return contents
end
--
-------------------------------------------------------
--local kwkVar = json.decode( jsonFile("kwkVars.json") )
-------------------------------------------------------
-- Check for saved variables
function _Class:kwkVarCheck(variable)
  -- kwkVar = json.decode( jsonFile("kwkVars.json") )
   local found = nil
   if kwkVar ~= nil then
      for i = 1, #kwkVar do
         if (variable == kwkVar[i].name) then
            found = kwkVar[i].value; break
         end
      end
   end
   return (found)
end
--save all permanent variables
function _Class:zeroesKwikVars(contents) --rest   t the file to save variable content
    local path = system.pathForFile( "kwkVars.json", system.DocumentsDirectory )
	local file, error= io.open( path, "w+" )
    print (contents, error)
	if file then
	   file:write(contents)
	   io.close( file )	-- close the file after using it
       file = nil
	end
end

function _Class:saveKwikVars(toSave) --toSave is a table with contents
   local varTab={}
	--loop current kwkVar content (contains ALL variables saved)
	local jsonString

	if type (kwkVar) ~= "table" then
       -- kwkVar.json is empty. Recreates the file with the new content
		varTab[1] = {["name"] = toSave[1],["value"] = toSave[2]}
		jsonString = json.encode( varTab )
        self:zeroesKwikVars(jsonString)
	else
		--there are already variables saved in the kwkVars.json file
		local ts = 0
		for i = 1,#kwkVar do
			if (toSave[1] == kwkVar[i].name) then
				kwkVar[i].value = toSave[2]
				varTab[i] = {["name"] = kwkVar[i].name,["value"] = kwkVar[i].value}
				ts = 1
			else
				varTab[i] = {["name"] = kwkVar[i].name,["value"] = kwkVar[i].value}
			end
        end
	    if (ts == 0) then --variable not in the file yet
	    	local x = #kwkVar
	    	x = x + 1
		    varTab[x] = {["name"] = toSave[1],["value"] = toSave[2]}
		end
	    jsonString = json.encode( varTab )
                --re-creation scenario
        self:zeroesKwikVars(jsonString)
    end
	--kwkVar = json.decode( jsonFile( "kwkVars.json" ) )
end

return _Class