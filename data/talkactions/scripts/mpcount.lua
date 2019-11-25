function onSay(cid, words, param)
local currentMana = getCreatureMana(cid)
local maxMana = getCreatureMaxMana(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Your current mana is " .. currentMana .. "/" .. maxMana .. ".")
end