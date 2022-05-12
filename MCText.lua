--Credits to Tripleluxen
--https://github.com/TripleLuxen
--https://community.fandom.com/wiki/User:TripleLuxen

local p = {}

Colors = {
	["Black"] = { Color = '#000000', Shadowcolor = "#000000"},
	["Dark Blue"] = { Color = '#0000AA', Shadowcolor = "#00002A"},
	["Dark Green"] = { Color = '#00AA00', Shadowcolor = "#002A00"},
	["Dark Aqua"] = { Color = '#00AAAA', Shadowcolor = "#002A2A"},
	["Dark Red"] = { Color = '#AA0000', Shadowcolor = "#2A0000"},
	["Dark Purple"] = { Color = '#AA00AA', Shadowcolor = "#2A002A"},
	["Gold"] = { Color = '#FFAA00', Shadowcolor = "#2A2A00"},
	["Gray"] = { Color = '#AAAAAA', Shadowcolor = "#2A2A2A"}, --Colors[Gray].Color is how im feeling rn
	["Grey"] = { Color = '#AAAAAA', Shadowcolor = "#2A2A2A"}, -- for you british people smh
	["Dark Gray"] = { Color = '#555555', Shadowcolor = "#151515"},
	["Dark Grey"] = { Color = '#555555', Shadowcolor = "#151515"},
	["Blue"] = { Color = '#5555FF', Shadowcolor = "#15153F"},
	["Green"] = { Color = '#55FF55', Shadowcolor = "#153F15"},
	["Aqua"] = { Color = '#55FFFF', Shadowcolor = "#153F3F"},
	["Red"] = { Color = '#FF5555', Shadowcolor = "#3F1515"},
	["Light Purple"] = { Color = '#FF55FF', Shadowcolor = "#3F153F"},
	["Gold"] = { Color = '#FFAA00', Shadowcolor = "#2A2A00"},
	["Yellow"] = { Color = '#FFFF55', Shadowcolor = "#3F3F15"},
	["White"] = { Color = '#FFFFFF', Shadowcolor = "#3F3F3F"},
	["Light Gold"] = { Color = '#F2C077', Shadowcolor = "#3C2F1E"}, --custom colors from varoius things in the server
	["Light Pink"] = { Color = '#D7A5B5', Shadowcolor = "#35282C"},
}
function p.text(frame)
		local colorarg = frame.args["Color"]
		local colorname = Colors[colorarg]
	text = mw.html.create("span")
	:css{
		["font-family"] = "minecraft",
		["text-shadow"] = "2px 2px "..colorname.Shadowcolor,
		color = colorname.Color,
	}
	:wikitext(tostring(frame.args["text"]))
	
	return text
	end
return p
