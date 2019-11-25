function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) then
		doPlayerSetSpecialDescription(thing.uid, ". \n Frags: "..math.max(0, getPlayerStorageValue(thing.uid, 20233)))
	end
	return true
end
