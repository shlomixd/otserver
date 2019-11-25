local config = {
	pos = {x = 436, y = 901, z = 7},
	itemid = 2346
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == config.itemid then
		doTeleportThing(cid, config.pos)
		doPlayerSendTextMessage(cid, 27, "You have been teleported")
	end
	
	return true
end