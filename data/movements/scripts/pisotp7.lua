function onStepIn(cid, item, position, fromPosition)

local teleport = {x=329, y=1005, z=7} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Welcome to the Rushford Valley!")
doSendMagicEffect(getPlayerPosition(cid), effect)
end
return TRUE
end