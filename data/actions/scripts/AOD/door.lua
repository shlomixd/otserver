function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos, door = getThingPos(cid), toPosition
	if isInArray({door.x-1, door.x+1}, pos.x) and pos.y == door.y then
		door.x = door.x + (pos.x < door.x and 1 or -1)
	elseif isInArray({door.y-1, door.y+1}, pos.y) and pos.x == door.x then
		door.y = door.y + (pos.y < door.y and 1 or -1)
	else
		return doPlayerSendCancel(cid, 'You must stand in front of the door!')
	end
	doTeleportThing(cid, door)
	doSendMagicEffect(door, CONST_ME_HEARTS)
	return true
end