function onStepIn(cid, item, position, fromPosition)

local teleport = {x=593, y=955, z=6} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
doSendMagicEffect(getPlayerPosition(cid), effect)
end
return TRUE
end