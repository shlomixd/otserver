--[[
		Raise&Mount System
		Developed by Colex
	Please do not remove the credits
]]--

local _CORPSE_ID = 2862 --Corpse's ID
local _CREATURE_OUTFIT = {lookType = 7, lookHead = 20, lookBody = 30, lookLegs = 40, lookFeet = 50, lookTypeEx = 0, lookAddons = 0} --Orc Warrior Outfit
local _CORPSE_WOLF_ID = 2969 --War Wolf corpse's ID
local _TRANSFORMATION_TIME = 15*60000 --Transformation time

local combat = createCombatObject()


_DEATH_RAISED = {}


local isItemInPos = function(pos, itemid)
	local item

	pos.stackpos = 0
	repeat
		item = getThingFromPos(pos)
		if (item.itemid == itemid) then
			return true, pos.stackpos, item
		end
		pos.stackpos = pos.stackpos + 1
	until item.itemid == 0

	return false
end


CreatureEventChecker = function(event, ...)
	if (isCreature(arg[1])) then
		event(unpack(arg))
	end
end

CreatureEvent = function(event, delay, ...)
	addEvent(CreatureEventChecker, delay, event, unpack(arg))
end

local doSendCreatureEffect = function(cid, effect, dist, frompos, offset)
	local pos = getCreaturePosition(cid)
	offset = offset or {x=0, y=0}
	pos.x = pos.x + (offset.x or 0)
	pos.y = pos.y + (offset.y or 0)
	if not(dist) then
		doSendMagicEffect(pos, effect)
	else
		doSendDistanceShoot(frompos, pos, 10)
	end
end

doTransformation = function(cid, undo)
	if not(undo) then
		doSetCreatureOutfit(cid, _CREATURE_OUTFIT, -1)
		_DEATH_RAISED[cid] = 1
		CreatureEvent(doTransformation, _TRANSFORMATION_TIME-1750, cid, true)
		doCreatureSetNoMove(cid, false)
	else
		doCreatureSetNoMove(cid, true)
		for n = 1, 4 do
			CreatureEvent(doSendCreatureEffect, 250*n, cid, 59 + math.mod(n, 2))
		end
		if (_DEATH_RAISED[cid] == 2) then
			CreatureEvent(doCreateItem, 1750, _CORPSE_WOLF_ID, getCreaturePosition(cid))
		end
		CreatureEvent(doSendCreatureEffect, 1250, cid, 50)
		CreatureEvent(doRemoveCondition, 1750, cid, CONDITION_OUTFIT)
		CreatureEvent(doCreatureSetNoMove, 1750, cid, false)
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		_DEATH_RAISED[cid] = 0
	end
end

function onCastSpell(cid, var)
	_DEATH_RAISED[cid] = _DEATH_RAISED[cid]  or 0

	if (_DEATH_RAISED[cid] > 0) then
		doPlayerSendCancel(cid, "You are already transformed!")
		return FALSE
	end

	local corpse, cpos

	local dir  = getCreatureLookDirection(cid)
	local pos  = getCreaturePosition(cid)



	if (dir == NORTH) then
		pos.y = pos.y - 1
	elseif (dir == SOUTH) then
		pos.y = pos.y + 1
	elseif (dir == EAST) then
		pos.x = pos.x + 1
	elseif (dir == WEST) then
		pos.x = pos.x - 1
	end
	pos.stackpos = 2

	_,_,corpse = isItemInPos(pos, _CORPSE_ID)
	if (corpse ~= nil) then
		doCreatureSetNoMove(cid, true)
		doRemoveItem(corpse.uid)
		doSendMagicEffect(pos, 65)
		CreatureEvent(doSendCreatureEffect, 1500, cid, 10, true, pos)
		cpos = getCreaturePosition(cid)
		cpos.y = cpos.y - 1
		CreatureEvent(doSendCreatureEffect, 2000, cid, 57, false, nil, {y=-1})
		CreatureEvent(doSendCreatureEffect, 2500, cid, 50)
		CreatureEvent(doTransformation, 3000, cid)
	else
		doPlayerSendCancel(cid, "Could not find an orc warriors corpse.")
		return FALSE
	end



	return doCombat(cid, combat, var)
end