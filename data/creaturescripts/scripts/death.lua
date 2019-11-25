local storage = 56486

function onDeath(cid, corpse, deathList)
	if isMonster(cid) then
		if getCreatureMaster(cid) ~= cid then
			doCreatureSetStorage(getCreatureMaster(cid), storageLol, os.time() + 10)
		end
	end
	return true
end