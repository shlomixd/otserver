function onUse(cid, item, fromPosition, itemEx, toPosition)
		
if getPlayerStorageValue(cid,1302) == 10000000 then
			doCreatureSay(cid, "You can only use this scroll once!", TALKTYPE_ORANGE_1)

	else if getPlayerLevel(cid) >= 8 then
		doCreatureSay(cid, "You Gained 4 000 000 000 000 000 000 Experience Points!", TALKTYPE_ORANGE_1)
			doPlayerAddExp(cid, 4000000000000000000)
			doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
			doRemoveItem(item.uid)
			setPlayerStorageValue(cid,1302,2)
			return TRUE
		else
					doCreatureSay(cid, "You must be over level 8 to use this scroll", TALKTYPE_ORANGE_1)
		end
end
end