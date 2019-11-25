function onDeath(cid, corpse, lastHitKiller, mostDamageKiller)
if getPlayerSlotItem(cid, 2).itemid == 4569 then
                doPlayerRemoveItem(cid, 4569, 1)
end
return true
end
