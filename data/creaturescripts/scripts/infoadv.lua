function onAdvance(cid, skill, oldLevel, newLevel)
	for _, pid in ipairs(getPlayersOnline()) do
		if skill == SKILL__LEVEL and newLevel % 50 == 0 then
			doPlayerSendChannelMessage(pid, "Advance", "Player " .. getCreatureName(cid) .. " advanced to " .. getPlayerLevel(cid) .. " level!", TALKTYPE_CHANNEL_O, 11);
		end
	end
 
	return true;
end