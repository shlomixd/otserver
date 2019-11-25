function onSay(cid, words, param, channel)
	local tmp = getWorldUpTime()
	local hours = math.ceil(tmp / 3600) - 1
	local minutes = math.ceil((tmp - (3600 * hours)) / 60)
	if(minutes == 60) then
		minutes = 0
		hours = hours + 1
	end
 
	local players = getPlayersOnline()
	local strings = {""}
	local sorc,druid,paladin,knight,rook = 0,0,0,0,0
 
	local i, position = 1, 1
	local added = false
	for _, pid in ipairs(players) do
		if isSorcerer(pid) then
			sorc = sorc + 1
		elseif isDruid(pid) then
			druid = druid + 1
		elseif isPaladin(pid) then
			paladin = paladin + 1
		elseif isKnight(pid) then
			knight = knight + 1
		elseif isRookie(pid) then
			rook = rook + 1
		elseif isPremium(pid) then
			prem = prem + 1
		end
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (i + 0) .. " We have: ".. sorc .." Wizards, ".. druid .." Magicians, ".. paladin .." Rangers and ".. knight .."Fighters.")
	return true
end

