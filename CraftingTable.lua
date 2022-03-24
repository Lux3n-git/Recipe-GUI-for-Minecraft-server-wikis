--This is the module that creates the minecraft table and displays the item sprites

--Files Needed:
--CheatInvisible.png
--MCTooltip.lua Module
--ItemSprite.lua Module
--Crafting Table Template (Template:CraftingTable


local g = {}
	function g.main(frame)
		function contains(list, x)
			for _, v in pairs(list) do
				if v == x then return true end
			end
			return false
		end
	function sprite(v, toppx, leftpx, bool) --creates a sprite instance 
		
		function thesprite(spriteimage, colorname, lorename, lorecolor)
			colorname = colorname or "White"
			local OA = ""
			if spriteimage  == "" then
				return '<div style="width:32px; height:32px; top:'..toppx..'px; left:'..leftpx..'px; position:absolute>[[File:CheatInvisible.png|link=]]</div>'
			else
				local tooltipsprite = --sprite tooltip
					mw.html.create("div")
					:addClass("tooltip-contents")
					:wikitext(frame:expandTemplate{title = "MCTooltip", args = { Color = colorname, content = spriteimage, Colorlore = lorecolor, lore = lorename }})
				local itemsprite = --sprite
					mw.html.create("div")
					:addClass("advanced-tooltip")
					:wikitext(frame:expandTemplate{title = "ItemSprite", args = { Item = spriteimage }})
				local OA =
				mw.html.create("div")
				:addClass("item-amount")
				:wikitext(tostring(frame.args["OA"]))
				:css{
					position = "absolute",
					right = "-2px",
					bottom = "-5px",
				    ["text-shadow"] = "0.125em 0.125em 0 #3F3F3F",
				    ["font-family"] = "minecraft",
				}
				
				if bool == true then --if it is the Output sprite, add OA to it
				itemsprite:node(OA)
				theresyouritem = itemsprite:node(tooltipsprite)
				else
				theresyouritem = itemsprite:node(tooltipsprite)
				end
			end
		return theresyouritem --i suck at making var names
		end
		
		images = {}
		for image in mw.text.gsplit( v,";") do --splits all names using the ";" given
			if image == "" or image == "Blank" or image == " Blank" then
			table.insert( images, '<span><div class=\"item-slot-box\" style="width:32px; height:32px;>[[File:CheatInvisible.png|link=]]</div></span>')
			else
					textformat = {}
					for split in mw.text.gsplit(image,":") do
						table.insert(textformat, split)
					end
					table.insert( images, '<span>'..tostring(thesprite(textformat[1], textformat[2], textformat[3], textformat[4]))..'</span>' )
			end
		end
		images[1] = images[1]:gsub( '<span>', '<span class="animated-active">' )

		return '<div class=\"animated item-slot-box\" style="width:32px; height:32px; top:'..toppx..'px; left:'..leftpx..'px; position:absolute>'..table.concat(images)..'</div>' --plan B for variables for the div CSS

	end
	local OA = --minecraft number next to sprite 
		mw.html.create("div")
		:addClass("item-amount")
		:wikitext(tostring(frame.args["OA"]))
		:css{
			position = "absolute",
			right = "-2px",
			bottom = "-4px",
		    ["text-shadow"] = "0.125em 0.125em 0 #3F3F3F",
		    ["font-family"] = "minecraft",
		}
		
	local div1 =  --main html division, this is the main object that is sent out while everything else is attached or within it
	mw.html.create("div")
		:css{
		    width = "256px",
		    height = "132px",
		    display = "table",
		}
		:wikitext("[[File:Crafting GUI.png|link=]]")
	local div2 = 
        mw.html.create("div")
			:css{
			position = "relative",
			top = "-118px",
			left = "14px",
			}
	if string.lower(frame.args["Shape"] or "") == "shapeless" then
		div2:node(
			mw.html.create("div")
			:addClass("shapeless-icon")
			:css{
			position = "absolute",
			width = "19px",
			height = "15px",
			left = "210px",
			}
		)
	
	end
		--attahes every sprite slot to the html division
		div2:node(sprite(tostring(frame.args["A1"] or ""), 0, 0))
		div2:node(sprite(tostring(frame.args["A2"] or ""), 36, 0))
		div2:node(sprite(tostring(frame.args["A3"] or ""), 72, 0))
	    div2:node(sprite(tostring(frame.args["B1"] or ""), 0, 36))
	    div2:node(sprite(tostring(frame.args["B2"] or ""), 36, 36))
	    div2:node(sprite(tostring(frame.args["B3"] or ""), 72, 36))
		div2:node(sprite(tostring(frame.args["C1"] or ""), 0, 72))
		div2:node(sprite(tostring(frame.args["C2"] or ""), 36, 72))
		div2:node(sprite(tostring(frame.args["C3"] or ""), 72, 72))
		div2:node(sprite(tostring(frame.args["Output"] or ""), 36, 188, true))
		div1:node(div2)
		
	return div1 -- told ya
	end
return g
