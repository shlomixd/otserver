function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local last = true -- Want time?
	local timeLast = 60 -- Sec

        -- Custom outfits --
	local customOutfit = false
	local monstersLookType = {12, 4, 32, 94}

-- else --
        -- Random from, to looktype --
	local lookTypeMin, lookTypeMax = 2, 100 -- Don't choose 1 because it will crash your client

	
	--- Don't touch ---
	local CustomOutfits = {lookType = monstersLookType[math.random(#monstersLookType)], lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
	local MathRandomOutfit = {lookType = math.random(lookTypeMin, lookTypeMax), lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
	
		if(customOutfit == true) then
			if(last == true) then
				doSetCreatureOutfit(cid, CustomOutfits, timeLast*1000)
			else
				doSetCreatureOutfit(cid, CustomOutfits, -1)
			end
		else
			if(last == true) then
				doSetCreatureOutfit(cid, MathRandomOutfit, timeLast*1000)
			else
				doSetCreatureOutfit(cid, MathRandomOutfit, -1)
			end
		end
		
	doSendMagicEffect(getCreaturePosition(cid), 12)
	return true
end