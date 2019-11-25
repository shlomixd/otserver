function onUse(cid, item, fromPosition, itemEx, toPosition)
	return doPlayerAddMana(itemEx.uid, 80000) and doSendAnimatedText(getThingPos(cid), "Manarune!", TEXTCOLOR_WHITE)
end