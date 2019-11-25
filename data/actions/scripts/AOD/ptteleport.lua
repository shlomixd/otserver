local config = 
{
    posWrong = {x=960, y=1075, z=7}, -- If they dont have required storage value
    posCorrect = {x=638, y=1753, z=7}, -- If they DO have correct storage value
	level = 717217 -- replace 'x' with required level
}
 
-- Fap script
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerLevel(cid) >= config.level then -- Checks if their level is equal to or higher than the configured level
		doTeleportThing(cid, config.posCorrect) -- teleport them to "posCorrect" value
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to the Premium Point QUEST!.")
	else
		doTeleportThing(cid, config.posWrong) -- reject their access.
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you are under 717217.")
	end
	return true
end