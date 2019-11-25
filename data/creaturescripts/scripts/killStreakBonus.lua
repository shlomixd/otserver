-------- ADD BONUS -----------
------- FIRST BONUS ----------
local firstBonus = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(firstBonus, CONDITION_PARAM_TICKS, 500000)
setConditionParam(firstBonus, CONDITION_PARAM_LIGHT_COLOR, 25)
setConditionParam(firstBonus, CONDITION_PARAM_LIGHT_LEVEL, 125)
setConditionParam(firstBonus, CONDITION_PARAM_STAT_MAXMANAPERCENT, 115)
setConditionParam(firstBonus, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 115)

----- /FIRST BONUS -----------
------ /ADD BONUS ------------
--- CARE PACKAGE FUNCTION  ---
 function setItemName(uid,name)
		return doItemSetAttribute(uid,'name',name)
    end	
--- /CARE PACKAGE FUNCTION ---
	
-- KILLSTREAK BONUS SYSTEM ---
function onKill(cid, target, lastHit)


-----Config-----
local killStreaks = 10010
local getKSP = getPlayerStorageValue(cid,killStreaks)
local addKSP = ((getPlayerStorageValue(cid,10000))+1)
local pos = getPlayerPosition(cid)
local dropZone = {x = pos.x+(math.random(-1,1)) , y = pos.y+(math.random(-1,1)), z = pos.z, stackpos=1}
local playerName = getPlayerName(cid)
local carePackage = " " .. getPlayerName(cid) .. "'s Care Package"
local dogsName = "Attack Dogs"
local nukeName = Nuke
local nukeWords = NUKEM
----/Config-----

       if isPlayer(target) == TRUE then
			if getKSP == 5 then
				doAddCondition(cid,firstBonus)
				doSendMagicEffect(pos,7)
				doPlayerAddItem(cid,2160,1)
			elseif getKSP == 10 then
				setItemName(doCreateItem(5675,1,dropZone),carePackage)
				doSendMagicEffect(pos,7)
				doPlayerAddItem(cid,2160,2)
			elseif getKSP == 15 then 
				doConvinceCreature(cid, doCreateMonster("".. dogsName .."", pos))
				doConvinceCreature(cid, doCreateMonster("".. dogsName .."", pos))
			else
				doPlayerSendCancel(cid,"You have a " .. getKSP .. " killstreak")
			end
		end
	return TRUE
end

-- /KILLSTREAK BONUS SYSTEM --
