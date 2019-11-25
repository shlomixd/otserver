function onUse(cid, item, fromPosition, itemEx, toPosition)
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 then
			doPlayerAddMana(itemEx.uid, 50000000) and doSendAnimatedText(getThingPos(cid), "Mega Mr!", TEXTCOLOR_WHITE)
		else
			doPlayerSendCancel(cid, "You don/'t have the right vocation to use this.")
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
	return true
end