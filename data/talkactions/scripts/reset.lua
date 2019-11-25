function onSay(cid, words, param)
local lvl = getPlayerLevel(cid) --the current player level
local maxlvl = 717217 --the level when the player gets rebirthed
local extrahp = getCreatureMaxHealth(cid)
local extramana = getCreatureMaxMana(cid)
	if lvl >= maxlvl then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You are now rebirthed!")  
        	doPlayerAddLevel(cid, -(maxlvl-100), true)
                setCreatureMaxHealth(cid, extrahp)
                setCreatureMaxMana(cid, extramana)
		else
			doPlayerSendTextMessage(cid, 22, "You do not reach the requirements")
			doSendMagicEffect(getPlayerPosition(cid),2)
 		end
end