function onAdvance(cid, skill, oldlevel, newlevel)
	if isInArray({0,1,2,3,4,5,6,7,8}, skill) == TRUE then
		return doPlayerSave(cid)
	end
end