local letters = "OWNED!"
 
function onPrepareDeath(cid, deathList)
	local p = getThingPos(cid)
	for i = 1, #letters do
		addEvent(doSendAnimatedText, i * 150, p, letters:sub(i, i), COLOR_RED)
	end
	return true
end