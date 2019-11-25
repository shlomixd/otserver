function onUse(cid, item, fromPosition, itemEx, toPosition)
	return doPlayerAddMana(itemEx.uid, 40000000) and doSendAnimatedText(getThingPos(cid), "Super MR!", TEXTCOLOR_WHITE)
end