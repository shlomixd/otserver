function onSay(cid, words, param, channel)
	local hp = getCreatureHealth(cid)
	local mhp = getCreatureMaxHealth(cid)
	local m = getCreatureMana(cid)
	local mm = getCreatureMaxMana(cid)
	local l = getPlayerLevel(cid)
	if (words == '!stats') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Level: " .. l .. ", Health: " .. hp .. "/" .. mhp .. ", Mana: " .. m .. "/" .. mm)
	elseif (words == '!level') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Level: " .. l)
	elseif (words == '!health') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Health: " .. hp .. "/" .. mhp)
	elseif (words == '!mana') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Mana: " .. m .. "/" .. mm)
	end
	return true
end