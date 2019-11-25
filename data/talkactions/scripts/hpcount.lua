function onSay(cid, words, param)
local currentHealth = getCreatureHealth(cid)
local maxHealth = getCreatureMaxHealth(cid)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your current health is " .. currentHealth .. "/" .. maxHealth .. ".")
end