function onUse(cid, item, fromPosition, itemEx, toPosition)	
	if isPlayer(cid) then
		doSendMagicEffect(getThingPosition(item.uid), 2)
		doCreatureSay(cid, "DESTROYED!", TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid)
		end
	return true
end