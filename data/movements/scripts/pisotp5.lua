function onStepIn(cid, item, position, fromPosition)

local teleport = {x=749, y=1465, z=10} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Welcome to Hell")
doSendMagicEffect(getPlayerPosition(cid), effect)
end
return TRUE
end