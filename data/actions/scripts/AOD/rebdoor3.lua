-- Reborn door script
function onUse(cid, item, fromPosition, itemEx, toPosition)
local rebornV = 2500 -- reborn value

	if getPlayerStorageValue(cid, rebornV) >= 3 then -- If players "reborn" storage is greater than 1. THEN:
		doTeleportThing(cid, toPosition) -- allow them to access door
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to Troll Champion.")
	else
		doTeleportThing(cid, fromPosition) -- reject their access.
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need 3reborn or more to enter!")
	end
	return true
end
