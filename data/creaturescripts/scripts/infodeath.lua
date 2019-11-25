function onKill (cid, target)
local nick = getCreatureName(target)
local nick2 = getCreatureName(cid)
	if isPlayer(cid) and isPlayer(target) then
                local lvl = getPlayerLevel(target)
		for _, pid in ipairs(getPlayersOnline()) do
			doPlayerSendChannelMessage(pid, "Death", "Player "..nick.." has been slain by "..nick2.." at "..lvl.." level.", TALKTYPE_CHANNEL_RN, 11)
		end
	end
return true
end

