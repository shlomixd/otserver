function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1005, y=1405, z=7} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPremium(cid) == TRUE then
doTeleportThing(cid, teleport)
doPlayerSendTextMessage(cid,22,"Welcome to the Rushford Valley")
doSendMagicEffect(getPlayerPosition(cid), effect)
else
doPlayerSendTextMessage(cid, 23, "Sorry, you need a premium.")
end
return TRUE
end