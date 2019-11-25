local storage = 10000
local playerOwner = 9500
local town = 5
local templePosition = {x=655,y=1014,z=7}
local born = 8
local castle = {
	[1] = "Honor",
	[2] = "Avarice",
	[3] = "Lust",
	[4] = "Wrath",
	[5] = "Greed",
	[6] = "Vanity",
	[7] = "Pride"
		}
local guildOwner = {
	[1] = 9001,
	[2] = 9002,
	[3] = 9003,
	[4] = 9004,
	[5] = 9005,
	[6] = 9006,
	[7] = 9007
		}


function onStepIn(cid, item, toPosition, fromPosition)

	if isPlayer(cid) == true then
		if getPlayerGroupId(cid) < 3 then
		local castle_id = item.actionid-9000
		local conquest_storage = item.actionid
		local war = getGlobalStorageValue(storage)
		local guild_owner = getGlobalStorageValue(conquest_storage)
		local get_guild = getPlayerGuildId(cid)
	
			if war >= 1 then
				if get_guild ~= guild_owner then 
					if castle_id == war then
						doPlayerSetTown(cid, born)
					else	
						doPlayerSendTextMessage(cid, 22, "The war isn't in this castle.")
						doTeleportThing(cid, templePosition)
					end
				end
			else
				if guild_owner ~= get_guild then

        				doPlayerSendTextMessage(cid, 22, "Your guild isn't the owner of this castle.")
					doPlayerSetTown(cid, 5)
					doTeleportThing(cid, templePosition)
        			return true
    				end
			end	
		end   
	end     
    return true
end