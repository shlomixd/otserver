local config = {
	useTrophy = "no", -- "yes" or "no"
	useHeart = "yes" -- "yes" or "no"
}
 
local BRONZE, SILVER, GOLD = 10129, 10128, 10127
 
function onDeath(cid, corpse, deathList)
	local reward = 0
 
	if(config.useTrophy) then
		config.useTrophy = getBooleanFromString(config.useTrophy)
	end
	if(config.useHeart) then
		config.useHeart = getBooleanFromString(config.useHeart)
	end
 
	local worldType = getConfigValue("worldType")
	if(worldType == "open") then
		for i = 1, #deathList do
			if(isPlayer(cid) and isPlayer(deathList[i])) then
				if(getPlayerIp(cid) ~= getPlayerIp(deathList[i])) then
 
					local var = {
						KILLER_NAME = getCreatureName(deathList[1]),
						TARGET_NAME = getCreatureName(cid),
						KILLER_LEVEL = getPlayerLevel(deathList[1]),
						TARGET_LEVEL = getPlayerLevel(cid)
					}
 
					if(var.TARGET_LEVEL > 8 and var.TARGET_LEVEL < 100) then 
						reward = BRONZE
					elseif(var.TARGET_LEVEL > 99 and var.TARGET_LEVEL < 200) then
						reward = SILVER
					elseif(var.TARGET_LEVEL > 199) then
						reward = GOLD
					end
 
					local heart, trophy = 0, 0
					if(config.useHeart) then
						heart = doAddContainerItem(corpse.uid, 5943, 1)
					end
 
					if(config.useTrophy) then
						trophy = doAddContainerItem(corpse.uid, reward, 1)
					end
 
					local killers = ""
					for i = 1, math.min(getConfigInfo('deathAssistCount') + 1, #deathList) do
						killers = killers .. (i == 1 and "" or ", ") .. (isMonster(deathList[i]) and "a " or "") .. getCreatureName(deathList[i])
					end
 
					if(config.useHeart) then
						doItemSetAttribute(heart, "name", "Heart of " .. var.TARGET_NAME)
						doItemSetAttribute(heart, "description", "It was taken from " .. var.TARGET_NAME .. "'s body. " .. (getPlayerSex(cid) == 0 and "She" or "He") .. " was killed at level " .. var.TARGET_LEVEL .. " by " .. var.KILLER_NAME .. ". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Unjustified)" or "(Justified)"))
					end
 
					if(config.useTrophy) then
						doItemSetAttribute(trophy, "description", "It was awarded to " .. var.KILLER_NAME .. " for killing " .. var.TARGET_NAME .. ". " .. (getPlayerSex(cid) == 0 and "She" or "He") .. " was killed at level " .. var.TARGET_LEVEL .. " by " .. var.KILLER_NAME .. " who was level " .. var.KILLER_LEVEL .. " at the time. " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Unjustified)" or "(Justified)"))
					end
 
					doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_RED)
				end
			end
		end
	end
 
	return true
end