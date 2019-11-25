local exhausted = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhausted, CONDITION_PARAM_TICKS, getConfigInfo('timeBetweenExActions') - 100)
setConditionParam(exhausted, CONDITION_PARAM_SUBID, EXHAUST_HEALING)
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getCreatureCondition(cid, CONDITION_EXHAUST) then
		doPlayerSendDefaultCancel(cid, "You are exhausted.")
	elseif not isPlayer(itemEx.uid) then
		doPlayerSendCancel(cid, 'You can only use this rune on players.')
	elseif getCreatureHealth(itemEx.uid) == getCreatureMaxHealth(itemEx.uid) then
		doPlayerSendCancel(cid, "The target got full health.")
	elseif getPlayerVocation(itemEx.uid) == 1 or getPlayerVocation(itemEx.uid) == 2 or getPlayerVocation(itemEx.uid) == 3 or getPlayerVocation(itemEx.uid) == 5 or getPlayerVocation(itemEx.uid) == 6 or getPlayerVocation(itemEx.uid) == 7 then
		doPlayerSendCancel(cid, "You or the target don't have the right vocation to use this.")
		return true
	else
		local lvl, mag, min, max = getPlayerLevel(cid), getPlayerMagLevel(cid)
		if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
			min = lvl * 1.0 + mag * 1.0
			max = lvl * 1.0 + mag * 1.0
		elseif getPlayerVocation(cid) == xx then
			min = lvl * 1.0 + mag * 1.0
			max = lvl * 1.0 + mag * 1.0
		elseif getPlayerVocation(cid) == xx then
			min = lvl * 0.5 + mag * 0.5
			max = lvl * 1.0 + mag * 1.0
		end
 
		local rand = math.random(min, max)
 
		rand = math.min(50000000, rand)
		rand = math.max(50000000, rand)
 
		doCreatureAddHealth(itemEx.uid, rand)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		doAddCondition(cid, exhausted)
		doCreatureSay(itemEx.uid, "Mega UH", TALKTYPE_ORANGE_1)
	end
	return true
end