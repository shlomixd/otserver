function onStepIn(cid, item, position, fromPosition)

local teleport = {x=853, y=834, z=9} -- Posi��o do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
end
return TRUE
end