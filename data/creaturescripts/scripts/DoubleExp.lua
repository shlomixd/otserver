local level == getPlayerLevel(cid)
local storage = 77788
local value = 1.25 -- 1.25 being 125% meaning normal + 25%
function onLogin(cid) 
    if (getPlayerLastLogin(cid) == nil) then
		setPlayerStorageValue(cid, storage, 2000 + 1)
		doPlayerSendTextMessage(cid, "Buy VIP to get doubled exp") 
    elseif (isPremium(cid)) then
		setPlayerStorageValue(cid, storage, 2001 + 1)
		doPlayerSetExtraExpRate(cid, value) 
		doPlayerSendTextMessage(cid, "You are level " .. getPlayerLevel(cid) .. ". At this level your current doubled exp is " .. getExperienceStage(level) * 2 .. "experience points!") 
    end
	registerCreatureEvent(cid, "DoubleExp-Logout")
	return true
end

function onLogout(cid) 
	if (isPremium(cid) and getPlayerStorageValue(cid, storage) == 2002) then
		doPlayerSetExtraExpRate(cid, -1 * value) 
		setPlayerStorageValue(cid, storage, 2001)
    end
	return true
end