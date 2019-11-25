function onStepIn(cid, item, position, fromPosition)

local teleport = {x=1270, y=763, z=6} -- Posição do teleport.
local effect = 10 -- Efeito do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
end
return TRUE
end