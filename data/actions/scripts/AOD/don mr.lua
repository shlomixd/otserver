function onUse(cid, item, fromPosition, itemEx, toPosition)
	return doPlayerAddMana(itemEx.uid, 140000000) and doSendAnimatedText(getThingPos(cid), "Don Mr!", TEXTCOLOR_WHITE)
end