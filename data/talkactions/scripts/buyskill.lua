function onSay(cid, words, param)
-- Changeable ------------------------------------------------------------------
local add = 10 -- how much skills add.
local druid_id = getPlayerVocation(cid, 1)
local sorcerer_id = getPlayerVocation(cid, 2)
local knight_id = getPlayerVocation(cid, 3)
local paladin_id = getPlayerVocation(cid, 4)
-- Price Changeable ------------------------------------------------------------
local itemid = 9020 -- Premium Tokens ID
local config = {
		mlvl = 5, -- how many Premium Tokens per skill
		dist = 5,
		sword = 5,
		club = 5,
		axe = 5
}
config.mlvl = getBooleanFromString(config.mlvl)
config.dist = getBooleanFromString(config.dist)
config.sword = getBooleanFromString(config.sword)
config.club = getBooleanFromString(config.club)
config.axe = getBooleanFromString(config.axe)
--------------------------------------------------------------------------------
-- Real Animation
-- Shows Message - "Skills" when bought?
local msgs = "yes" -- if set yes, the msg is showing only near of player (1sqm x 1sqm) 
--------------------------------------------------------------------------------
 
-- here check for Skill -> Magic Levels
if getPlayerItem(cid, itemid, config.mlvl) == true then
	if druid_id and sorcerer_id and getPlayerSkill(cid, 7) <= 200 then -- the limit of skill
		return doPlayerSendCancel(cid, "You cannot buy magic levels, when your magic level is higher than 200.")
	else
		doPlayerSetMagic(cid, getPlayerMagLevel(cid)+add)
		doPlayerRemoveItem(cid, itemid, config.mlvl)
	if(not msgs) then
		doSendAnimatedText(pos, "Skills!", 18)
	else
			for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doSendAnimatedText(pos, "Skills!", 18)
	end
	end
	end
end
else
doPlayerSendTextMessage(cid,22,"You don't have enough PT. It cost " .. config.mlvl .. " Premium Tokens.")
end
-- here check for Skill -> Distance
if getPlayerItem(cid, itemid, config.dist) == true then
	if paladin_id and getPlayerSkill(cid, 4) <= 350 then
		return doPlayerSendCancel(cid, "You cannot buy distance fighting, when your distance is higher than 350.")
	else
		doPlayerSetSkill(cid, getPlayerSkill(cid, 4)+add)
		doPlayerRemoveItem(cid, itemid, config.dist)
	if(not msgs) then
		doSendAnimatedText(pos, "Skills!", 18)
	else
			for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doSendAnimatedText(pos, "Skills!", 18)
	end
	end
	end
end
else
doPlayerSendTextMessage(cid,22,"You don't have enough PT. It cost " .. config.dist .. " Premium Tokens.")
end
-- here check for Skill -> Sword
if getPlayerItem(cid, itemid, config.sword) == true then
	if knight_id and getPlayerSkill(cid, 1) <= 350 then
		return doPlayerSendCancel(cid, "You cannot buy sword fighting, when your sword is higher than 350.")
	else
		doPlayerSetSkill(cid, getPlayerSkill(cid, 1)+add)
		doPlayerRemoveItem(cid, itemid, config.sword)
	if(not msgs) then
		doSendAnimatedText(pos, "Skills!", 18)
	else
			for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doSendAnimatedText(pos, "Skills!", 18)
	end
	end
	end
end
else
doPlayerSendTextMessage(cid,22,"You don't have enough PT. It cost " .. config.sword .. " Premium Tokens.")
end
-- here check for Skill -> Club
if getPlayerItem(cid, itemid, config.club) == true then
	if knight_id and getPlayerSkill(cid, 2) <= 350 then
		return doPlayerSendCancel(cid, "You cannot buy club fighting, when your club is higher than 350.")
	else
		doPlayerSetSkill(cid, getPlayerSkill(cid, 2)+add)
		doPlayerRemoveItem(cid, itemid, config.club)
	if(not msgs) then
		doSendAnimatedText(pos, "Skills!", 18)
	else
			for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doSendAnimatedText(pos, "Skills!", 18)
	end
	end
	end
end
else
doPlayerSendTextMessage(cid,22,"You don't have enough PT. It cost " .. config.club .. " Premium Tokens.")
end
-- here check for Skill -> Axe
if getPlayerItem(cid, itemid, config.axe) == true then
	if knight_id and getPlayerSkill(cid, 3) <= 350 then
		return doPlayerSendCancel(cid, "You cannot buy axe fighting, when your axe is higher than 350.")
	else
		doPlayerSetSkill(cid, getPlayerSkill(cid, 3)+add)
		doPlayerRemoveItem(cid, itemid, config.axe)
	if(not msgs) then
		doSendAnimatedText(pos, "Skills!", 18)
	else
			for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doSendAnimatedText(pos, "Skills!", 18)
	end
	end
	end
end
else
doPlayerSendTextMessage(cid,22,"You don't have enough PT. It cost " .. config.axe .. " Premium Tokens.")
end
-- done
return true
end