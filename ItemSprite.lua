--[[Creates a instance of a minecraft toolbar item sprite either by picking from a table of 
vanilla minecraft images or finds a image from the wiki with the prefix "Crafting".
Program was created by https://github.com/MelnCat with additions by me.
]]--
--Files Needed:
--InvSprite.lua
--common.css
--CheatInvisible.png

local s = {}
local data = mw.loadData("Module:InvSprite")
local cfg = data.settings

function getElement(item)
	local it = (item == "Unknown" or item == "{{{Item}}}") and { pos = 1 } or data.ids[item]
	if it == nil then 
	local strit = tostring(item)
	if string.match(strit, "Any") then 
		return mw.html.create("div"):wikitext("[[File:Crafting " .. item .. ".gif|link=]]")
	
	elseif string.match(strit, "Blank") then
		return mw.html.create("div"):wikitext("[[File:CheatInvisible.png|Link=]]")
	else
	return mw.html.create("div"):wikitext("[[File:Crafting " .. item .. ".png|link=]]") 
	end
	end
	local pos = it.pos - 1;
	local xpos = pos % (cfg.sheetsize / cfg.size)
	local ypos = math.floor(pos / (cfg.sheetsize / cfg.size))
	local box = mw.html.create("div")
		:addClass("item-slot")
		:css{
			height = cfg.size .. "px",
			width = cfg.size .. "px",
			["background-position"] = -xpos * cfg.size .. "px " .. -ypos * cfg.size .. "px",
			positon = "relative",
		}
	return box;
end
function s.gettheelement(item)
	return getElement(item)
end
function s.main(frame)
	local item = frame.args[1]
	local elem = getElement(item)
	local count = tonumber(frame.args[2] or 1)
	elem:css{
		display = "inline-block",
		position = "relative",
	}
	if count ~= 1 then 
		elem:node(
			mw.html.create("div")
				:addClass("item-amount")
				:wikitext(tostring(count))
				:css{
					position = "absolute",
					right = "-2px",
					bottom = "-4px",
		    		["text-shadow"] = "0.125em 0.125em 0 #3F3F3F",
		    		["font-family"] = "minecraft",
				}
		)
	end
	return tostring(elem)
end

return s
