  local config =
{
    posWrong = {x=1093, y=1151, z=7}, -- If they dont have required storage value
    posCorrect = {x=1093, y=1151, z=7}, -- If they DO have correct storage value
	rebornV = 2500 -- reborn storage
	rebornN = 1 -- reborn value requirement
}

-- Reborn teleport script
function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, config.rebornV) >= config.rebornN then -- If players "reborn" storage is greater than RebornN. THEN:
		doTeleportThing(cid, config.posCorrect) -- teleport them to "posCorrect" value
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to Island Troll.")
	else
		doTeleportThing(cid, config.posWrong) -- reject their access.
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you are under the requirement reborn.")
	end
	return true
end
