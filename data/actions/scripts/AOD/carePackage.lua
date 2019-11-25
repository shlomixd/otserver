

function onUse(cid, item, fromPosition, itemEx, toPosition)
----- CONFIG ------
local crateName = " " .. getPlayerName(cid) .. "'s Carepackage"
local rand = math.random(1,16)
local pos = getPlayerPosition(cid)
---- RANDOM ITEMS "IDS" ----
local packageOne = 2160
local packageTwo = 2157
local packageThree = 2152
local packageFour = 8473
local packageFive = 7590
local packageSix = 5944
--- /RANDOM ITEMS "IDS" ----

---- /CONFIG ------
		if string.find(getItemAttribute(item.uid, "name"):lower(), getCreatureName(cid):lower()) ~= nil then
			if rand == 1 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 2 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,2)))
			elseif rand == 3 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 4 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 5 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 6 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 7 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,2)))
			elseif rand == 8 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 9 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 10 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 11 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 12 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,2)))
			elseif rand == 13 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 14 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 15 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 16 then
				doPlayerAddItem(cid,packageSix,(math.random(1,25)))
				doCreatureSay(cid, "OBTAINED POWER ORB!", TALKTYPE_ORANGE_1)
			end
				doRemoveItem(item.uid)
				
		elseif string.find(getItemAttribute(item.uid, "name"):lower(), getItemNameById(5676):lower()) ~= nil then
            doCreatureSay(cid, "Script Worked!", TALKTYPE_ORANGE_1)
			if rand == 1 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 2 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,5)))
			elseif rand == 3 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 4 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 5 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 6 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 7 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,5)))
			elseif rand == 8 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 9 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 10 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 11 then
				doPlayerAddItem(cid,packageOne,(math.random(25,50)))
			elseif rand == 12 then
				doPlayerAddItem(cid,packageTwo,(math.random(1,5)))
			elseif rand == 13 then
				doPlayerAddItem(cid,packageThree,(math.random(50,100)))
			elseif rand == 14 then
				doPlayerAddItem(cid,packageFour,1)
			elseif rand == 15 then
				doPlayerAddItem(cid,packageFive,1)
			elseif rand == 16 then
				doPlayerAddItem(cid,packageSix,(math.random(1,5)))
				doCreatureSay(cid, "OBTAINED POWER ORB!", TALKTYPE_ORANGE_1)
			end
				doRemoveItem(item.uid)
		else  
			doCreatureSay(cid, "You are not the Owner of this Care Package!", TALKTYPE_ORANGE_1)
		end
	return true
end