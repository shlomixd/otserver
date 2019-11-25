function onSay(cid, words, param)
    if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) then
        doPlayerSendCancel(cid,'You have already got one or more blessings!')
    else
        if doPlayerRemoveMoney(cid, 60000) == TRUE then
			if isPremium(cid) == TRUE then
		
				for i = 1,5 do
				doPlayerAddBlessing(cid, i)
				end

				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)
				doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have been blessed by the gods!')
			
			else
			doPlayerSendCancel(cid, "You need a premium account!")
			end
        else
            doPlayerSendCancel(cid, "You need 6 crystal coin to get blessed!")
        end
    end    
    return 1
end