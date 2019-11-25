function onUse(cid, item, frompos, item2, topos)
 
local rand = math.random(1,10)
 
	if rand == 1 then
		doPlayerSay(cid, "Cough!, Cough!..." ,16)
		doPlayerAddHealth(cid, -5)
		doSendMagicEffect(topos,34)
		doRemoveItem(item.uid, 1)
 
		return 1
 
	else
		doPlayerSay(cid, "Fhuuu..." ,16)
		doSendMagicEffect(topos,2)
		doRemoveItem(item.uid, 1)
 
		return 1
  	end
end
