function onUse(cid, item, fromPosition, itemEx, toPosition)
	local exhaust = getPlayerStorageValue(cid, 66660) + 300
	if (os.time() >= exhaust) then
		setPlayerStorageValue(cid, 66660, os.time())
		doSendMagicEffect(toPosition, CONST_ME_GIFT_WRAPS)
		doPlayerSendTextMessage(cid, 22, 'You are now wearing a 1 time use condom!')
		doRemoveItem(item.uid, 1)
	else
		doPlayerSendCancel(cid, 'You are already safe for sex!')
	end
	return TRUE
end