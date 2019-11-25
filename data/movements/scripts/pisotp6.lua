function onStepIn(cid, item, position, fromPosition)

local teleport = {x=652, y=1097, z=12} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
doSendMagicEffect(getPlayerPosition(cid), effect)
end
return TRUE
end