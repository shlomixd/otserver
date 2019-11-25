function onStepIn(cid, item, position, fromPosition)

local teleport = {x=339, y=1157, z=7} -- Posição do teleport.
local effect = 53 -- Efeito Agua.

if isPlayer(cid) == TRUE then
doTeleportThing(cid, teleport)
doSendMagicEffect(getPlayerPosition(cid), effect)
end
return TRUE
end