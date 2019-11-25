local config = {
itemid = 8982,
effect = 52,
count = 10000000,
storage = 55555 -- use a free storage for this function.
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
setPlayerStorageValue(cid, config.storage, 3)
if (item.itemid == config.itemid and getPlayerStorageValue(cid, config.storage) > 0 ) then
	local i = math.random(1, 6)
	local sets = {[1] = math.random(2, 74), [2] = math.random(76, 134), [3] = math.random(136, 160), [4] = math.random(192, 265), [5] = math.random(267, 301), [6] = math.random(303, 351)}
	local tmp = getCreatureOutfit(cid)
	tmp.lookType = sets[i]
	doCreatureChangeOutfit(cid, tmp)
	doSendMagicEffect(getCreaturePosition(cid), config.effect)
	if (config.count == 0) then
		config.count = 3
	end
	if (config.count > 0) then
		config.count = config.count - 1
		setPlayerStorageValue(cid, config.storage, config.count)	
	else
		setPlayerStorageValue(cid, config.storage, 2)
	end
		if (getPlayerStorageValue(cid, config.storage) == 1 ) then
			doCreatureSay(cid, "You have "..getPlayerStorageValue(cid, config.storage).." charge left", TALKTYPE_ORANGE_1)
		else 
			doCreatureSay(cid, "You have "..getPlayerStorageValue(cid, config.storage).." charges left", TALKTYPE_ORANGE_1)
		end
	end
if (getPlayerStorageValue(cid, config.storage) == 0 ) then
	doRemoveItem(item.uid, 1)
end	
return true
end