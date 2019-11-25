local t = {
	percent = 40,
	monsters = {
		['troll'] = 75, 
		['frost giant'] = 75,
              ['zombie'] = 70,
		['mother'] = 60,
		['evil Eye'] = 40,
		['exodius'] = 40,
		['amirs bodyguard'] = 20,
		['paradise master'] = 10
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local desc = getItemAttribute(item.uid, 'description') == nil and getItemInfo(item.itemid).description or getItemAttribute(item.uid, 'description')
	
	if isMonster(itemEx.uid) then
		if t.monsters[getCreatureName(itemEx.uid):lower()] then
			if getCreatureHealth(itemEx.uid) <= getCreatureMaxHealth(itemEx.uid) * t.percent / 100 then
				local desc = getItemAttribute(item.uid, 'description') == nil and getItemInfo(item.itemid).description or getItemAttribute(item.uid, 'description')
				if string.find(desc:lower(), 'catched monster:') == nil then
					if math.random(1, 100) < t.monsters[getCreatureName(itemEx.uid):lower()] then
						doSendMagicEffect(toPosition, CONST_ME_YALAHARIGHOST)
						
						local newItem = doPlayerAddItem(cid, 5468, 1)
						doItemSetAttribute(newItem, 'description', desc .. ' Catched monster: ' .. getCreatureName(itemEx.uid):lower() .. '. ' .. getCreatureName(cid) .. ' has catched this monster.')
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You successfuly catched ' .. getCreatureName(itemEx.uid):lower() .. ' into the bottle.')
						doRemoveCreature(itemEx.uid)
					else
						doSendMagicEffect(toPosition, CONST_ME_GROUNDSHAKER)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You failed at capturing monster.')
						doRemoveCreature(itemEx.uid)
					end
					doRemoveItem(item.uid)
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You can\'t catch two monsters into same bottle.')
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Creature do not have require low health.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You can use it only on specific monsters.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You can use it only on monsters.')
	end
	return true
end