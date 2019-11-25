function onUse (cid, item, fromPosition, itemEx, toPosition)
	if (getCreatureCondition(cid, CONDITION_EXHAUST)) then
		doPlayerSendCancel(cid, "You are exhausted.")
	else
		if getPlayerMagLevel(cid) >= 3 then
			if isPlayer(cid) then
				doCreatureAddHealth(cid, 140000000)
				doCreatureAddMana(cid, 140000000)
				doCreatureSay(cid, "Don Mixed Rune!", TALKTYPE_ORANGE_1)
			end
		end
	end
    return true
end