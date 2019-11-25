local storage = 56486

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local desc = getItemAttribute(item.uid, 'description') == nil and getItemInfo(item.itemid).description or getItemAttribute(item.uid, 'description')

	if not isCreature(itemEx.uid) then
		if getCreatureStorage(cid, storageLol) < os.time() then
			if string.find(desc:lower(), 'catched monster:') ~= nil then
				local x, y = string.find(desc, ': %a+.')
				local a, b = string.find(desc, ': %a+ %a+.')
				
				if a ~= nil then
					if #getCreatureSummons(cid) == 0 then
						doSummonMonster(cid, string.sub(desc, a + 2, b - 1))
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You summoned a monster.')
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You\'ve already summoned a monster.')
					end
				elseif x ~= nil then
					if #getCreatureSummons(cid) == 0 then
						doSummonMonster(cid, string.sub(desc, x + 2, y - 1))
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You summoned a monster.')
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You\'ve already summoned a monster.')
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Unknown monster.')
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You didn\'t catch anything into the bottle.')
			end
		else
			doPlayerSendCancel(cid, 'You need to wait before summoning it again.')
		end
	elseif itemEx.uid == cid then
		if #getCreatureSummons(cid) > 0 then
			if string.find(desc:lower(), 'catched monster:') ~= nil then
				local x, y = string.find(desc, ': %a+.')
				local a, b = string.find(desc, ': %a+ %a+.')
				
				if a ~= nil then
					for k, v in pairs(getCreatureSummons(cid)) do
						if getCreatureName(v):lower() == string.sub(desc, a + 2, b - 1) then
							doRemoveCreature(v)
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Your monster is back to the bottle.')
							break
						end
					end		
				elseif x ~= nil then
					for k, v in pairs(getCreatureSummons(cid)) do
						if getCreatureName(v):lower() == string.sub(desc, x + 2, y - 1) then
							doRemoveCreature(v)
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Your monster is back to the bottle.')
							break
						end
					end				
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Unknown monster.')
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You didn\'t catch anything into the bottle.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You didn\'t summon anything.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You can summon a catched monster if you use it on a tile or on ur self if you want to summon it back to the bottle.')
	end
	return true
end