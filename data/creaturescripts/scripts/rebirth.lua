local storage = 2500 -- same as in rebirth npc

function onLook(cid, thing, position, lookDistance)
	if not isPlayer(thing.uid) then
		return true
	end

	doPlayerSetSpecialDescription(thing.uid, '. Done rebirths: ' .. math.max(0, getCreatureStorage(thing.uid, storage)))
	return true
end


	