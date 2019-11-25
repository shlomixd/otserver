function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) then
		local k = getPlayerMarriage(getPlayerGUID(thing.uid))
		if k then
			doPlayerSetSpecialDescription(thing.uid,'. ' .. (thing.uid == cid and 'You are' or (getPlayerSex(thing.uid) == 0 and 'She' or 'He') .. ' is') .. ' married to ' .. getPlayerNameByGUID(k))
		end
	end
	return true
end