function onStepIn(cid, item, position, fromPosition)

local teleport = {x=689, y=1100, z=12} -- Posição do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
end
return TRUE
end