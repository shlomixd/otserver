local a = { -- A Position in each house.
		{x="682", y="1356", z="4"},
		{x="682", y="1371", z="4"},
		{x="666", y="1358", z="4"},
		{x="666", y="1371", z="4"},
		{x="698", y="1358", z="4"},
		{x="698", y="1371", z="4"},
		{x="714", y="1359", z="4"},
		{x="714", y="1371", z="4"}
	}
 
--[[Script]]--
function getPlayersByAccount(id)
	local f = db.getResult("SELECT `id` FROM `players` WHERE `account_id` = "..id..";")
	local players = {}
	if f:getID() ~= -1 then
		repeat
			table.insert(players, f:getDataInt("id"))
		until not f:next()
		f:free()
	end
	return players
end
 
function accountOwnHouse(id)
	local players, haveHouse = getPlayersByAccount(id), false
	for _,ids in ipairs(players) do
		if getHouseByPlayerGUID(ids) ~= nil then
			haveHouse = true
			break
		end
	end
	return haveHouse
end
function getFreeHouse()
	for _,housePos in ipairs(a) do
		local house = getHouseFromPos(housePos)
		if getHouseOwner(house) == 0 then
			return house
		end
	end
	return false
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local house = getFreeHouse()
	if not house then
		doPlayerSendTextMessage(cid, 21, "Sorry, There are no more Donation houses PLEASE CONTACT THE ADMIN.")
		return true
	end
	if accountOwnHouse(getPlayerAccountId(cid)) then
		doPlayerSendTextMessage(cid, 21, "Sorry, This account already owns a house.")
		return true
	end
	doPlayerSendTextMessage(cid, 21, "Congratulations! Now you own  "..getHouseName(house).." which is located in "..getTownName(getHouseTown(house)).." town.")
	setHouseOwner(house, getPlayerGUIDByName(getCreatureName(cid)))
 
	return true
end