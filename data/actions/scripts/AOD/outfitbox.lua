local config = {
	itemid = 10503,
	outfit = {
		male = 328,
		female = 329
	},
	storage = 61666
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (item.itemid == config.itemid) then
		if (getPlayerStorageValue(cid, config.storage) == -1) then
			if (getPlayerSex(cid) == 0) then
				doPlayerAddOutfit(cid, config.outfit.female, 0)
				doPlayerSendTextMessage(cid, 20, "Congradulations! You now have your wedding outfit.")
				doRemoveItem(item.uid, 0)
				doPlayerSetStorageValue(cid, config.storage, 1)
			elseif (getPlayerSex(cid) == 1) then
				doPlayerAddOutfit(cid, config.outfit.male, 0)
				doPlayerSendTextMessage(cid, 20, "Congradulations! You now have your wedding outfit.")
				doRemoveItem(item.uid, 0)
				doPlayerSetStorageValue(cid, config.storage, 1)
			else
				return false
			end
		else
			doPlayerSendCancel(cid, "You have already used this item.")
		end
	end
	return true
end