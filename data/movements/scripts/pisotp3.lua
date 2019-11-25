function onStepIn(cid, item, position, fromPosition)

local teleport = {x=918, y=1152, z=9} -- Posição do teleport.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
end
return TRUE
end