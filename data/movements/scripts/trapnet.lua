function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doCreatureSetNoMove(cid, true)
	doSendMagicEffect(getCreaturePosition(cid), 31)
	doCreatureSay(cid, "TRAPPED!", TALKTYPE_ORANGE_1)
	addEvent(doCreatureSetNoMove, 1000*3, cid, false)
	doRemoveItem(item.uid)
return true
end