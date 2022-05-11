--This is the module that creates the minecraft table and displays the item sprites

--Files Needed:
--CheatInvisible.png
--MCTooltip.lua Module
--ItemSprite.lua Module
--Crafting Table Template (Template:CraftingTable


local g = {}
		function sprite(frame, v, toppx, leftpx, OAValue) --creates a sprite instance 
			OAValue = OAValue or nil
			function thesprite(spriteimage, colorname, lorename, lorecolor)
				colorname = colorname or "White"
				local OA = ""
				if spriteimage  == "" then
					return '<div style="width:32px; height:32px; top:'..toppx ..'px; left:'..leftpx ..'px; position:absolute>[[File:CheatInvisible.png|link=]]</div>'
				else
					nickt = {}
					for nick in mw.text.gsplit(spriteimage,"/") do
						table.insert(nickt, nick)
					end
					local tooltipsprite = --sprite tooltip
						mw.html.create("div")
						:addClass("tooltip-contents")
						:wikitext(frame:expandTemplate{title = "MCTooltip", args = { Color = colorname, content = nickt[1], Colorlore = lorecolor, lore = lorename, Nick = nickt[2]}})
					local itemsprite = --sprite
						mw.html.create("div")
						:addClass("advanced-tooltip")
						:wikitext(frame:expandTemplate{title = "ItemSprite", args = { Item = nickt[1] }})
					
					if OAValue ~= nil and OAValue ~= "{{{OA}}}" then
					local OA =
					mw.html.create("div")
					:addClass("item-amount")
					:wikitext(tostring(OAValue))
					:css{
						position = "absolute",
						right = "-2px",
						bottom = "-7px",
					    ["text-shadow"] = "0.125em 0.125em 0 #3F3F3F",
					    ["font-family"] = "minecraft",
					}
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

		return '<div class=\"animated item-slot-box\" style="width:32px; height:32px; top:'..toppx ..'px; left:'..leftpx ..'px; position:absolute>'..table.concat(images)..'</div>' --plan B for variables for the div CSS

		end
	function g.main(frame)
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
		div2:node(sprite(frame:getParent(), frame.args["A1"] or "", 0, 0))
		div2:node(sprite(frame:getParent(), frame.args["A2"] or "", 36, 0))
		div2:node(sprite(frame:getParent(), frame.args["A3"] or "", 72, 0))
	    div2:node(sprite(frame:getParent(), frame.args["B1"] or "", 0, 36))
	    div2:node(sprite(frame:getParent(), frame.args["B2"] or "", 36, 36))
	    div2:node(sprite(frame:getParent(), frame.args["B3"] or "", 72, 36))
		div2:node(sprite(frame:getParent(), frame.args["C1"] or "", 0, 72))
		div2:node(sprite(frame:getParent(), frame.args["C2"] or "", 36, 72))
		div2:node(sprite(frame:getParent(), frame.args["C3"] or "", 72, 72))
		div2:node(sprite(frame:getParent(), frame.args["Output"] or "", 36, 188, frame.args["OA"]))
		div1:node(div2)
		
	return div1 -- told ya
	end
	function g.smelting(frame)
		local div1 =  --main html division, this is the main object that is sent out while everything else is attached or within it
			mw.html.create("div")
			:css{
				left = "0px",
				top = "0px",
			    width = "192px", 
			    height = "140px",
			    ["position"] = "relative"
			}
		    :wikitext("[[File:Furnace GUI.png|link=]]")
		div1:node(sprite(frame:getParent(), frame.args["Input"] or "", 18, 18))
		div1:node(sprite(frame:getParent(), frame.args["Fuel"] or "", 89 , 18 ))
		div1:node(sprite(frame:getParent(), frame.args["Output"] or "", 53, 136.5, frame.args["OA"]))
		return div1
	end
	function g.stonecutting(frame)
		local div1 =  --main html division, this is the main object that is sent out while everything else is attached or within it
			mw.html.create("div")
			:css{
				left = "0px",
				top = "0px",
			    width = "210px", 
			    height = "154px",
			    ["position"] = "relative"
			}
		    :wikitext("[[File:Stonecutter GUI.PNG|link=]]")
		div1:node(sprite(frame:getParent(), frame.args["Input"] or "", 61, 16))
		div1:node(sprite(frame:getParent(), frame.args["Output"] or "", 31 , 69 ))
		div1:node(sprite(frame:getParent(), frame.args["Output"] or "", 60, 151, frame.args["OA"]))
		return div1
	end
	function g.smithing(frame)
		local div1 =  --main html division, this is the main object that is sent out while everything else is attached or within it
			mw.html.create("div")
			:css{
				left = "0px",
				top = "0px",
			    width = "260px", 
			    height = "136px",
			    ["position"] = "relative"
			}
		    :wikitext("[[File:Smithing Table GUI.png|link=]]")
		div1:node(sprite(frame:getParent(), frame.args["Input1"] or "", 52, 16))
		div1:node(sprite(frame:getParent(), frame.args["Input2"] or "", 52 , 88 ))
		div1:node(sprite(frame:getParent(), frame.args["Output"] or "", 52, 204, frame.args["OA"]))
		return div1
	end
return g
