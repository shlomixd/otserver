local telepos = {x=960, y=1075, z=7} --Edit this to your starting position
 
function onStepIn(cid, item, pos, fromPos)
 
	if item.actionid == 4020 then
	 if (isPlayer(cid)) then
		doTeleportThing(cid, telepos)
		doSendMagicEffect(telepos, CONST_ME_ENERGYAREA)
		doPlayerSendTextMessage(cid, 22, "Wrong tile, try again!")
	 end
	end
end