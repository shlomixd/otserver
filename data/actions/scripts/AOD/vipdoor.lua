function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
		if (item.actionid == 2112 and getPlayerStorageValue(cid,11551) >= 1) then
			if cidPosition.x < toPosition.x then
				doTeleportThing(cid, {x=toPosition.x,y=toPosition.y,z=toPosition.z}, TRUE)
								doCreatureSay(cid, "Welcome VIP Player!", TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, {x=toPosition.x,y=toPosition.y,z=toPosition.z}, TRUE)
								doCreatureSay(cid, "Welcome VIP Player!", TALKTYPE_ORANGE_1)
			end
			return TRUE
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, but only VIP Players can pass here! Msg owner for more info.")
			return TRUE
	end
	return FALSE
end