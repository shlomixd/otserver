--- Script by Kekox
function onStepIn(cid, item, position, fromPosition)
         if getPlayerVipDays(cid) == 0 then
             doTeleportThing(cid, fromPosition, FALSE)
         end
return true
end