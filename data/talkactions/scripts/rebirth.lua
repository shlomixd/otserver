local storage = 2500 -- same as in rebirth.lua

function onSay(cid, words, param)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'You done ' .. math.max(0, getCreatureStorage(cid, storage)) .. ' rebirths.')	
	return true
end