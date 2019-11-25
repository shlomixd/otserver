function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ParaOt] At the moment there is ".. getOnlinePlayers() .." player(s) online. To see the complet list of names, say: !players.")
	return true
end

