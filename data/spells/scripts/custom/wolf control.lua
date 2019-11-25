--[[
		Raise&Mount System
		Developed by Colex
	Please do not remove the credits
]]--


local _RIDE_NAME = "War Wolf" --Name of the creature to be ride
local _ORC_RIDER_OUTFIT = {lookType = 4, lookHead = 20, lookBody = 30, lookLegs = 40, lookFeet = 50, lookTypeEx = 0, lookAddons = 0} --Orc Rider's Outfit
local _SPEED_RATE = 3 --Speed Rate of a riding player


local combat = createCombatObject()

function onCastSpell(cid, var)
	_DEATH_RAISED[cid] = _DEATH_RAISED[cid]  or 0

	if (_DEATH_RAISED[cid] <= 0) then
		doPlayerSendCancel(cid, "You need to be an Orc Warrior to control this creature!")
		return FALSE
	elseif (_DEATH_RAISED[cid] >= 2) then
		doPlayerSendCancel(cid, "You are already mounted!")
	end

	local target = getCreatureTarget(cid)
	local tPos, cPos

	if (getCreatureName(target):lower() == _RIDE_NAME:lower() and not isPlayer(target)) then
		tPos = getCreaturePosition(target)
		cPos = getCreaturePosition(cid)
		doCreatureSetNoMove(target, true)
		doCreatureSetNoMove(cid, true)
		doSendMagicEffect(cPos, 49)
		addEvent(doSendDistanceShoot, 800, cPos, tPos, 30)
		addEvent(doSendMagicEffect, 950, tPos, 49)
		CreatureEvent(doRemoveCreature, 1050, target)
		addEvent(doSendDistanceShoot, 1900, tPos, cPos, 31)
		CreatureEvent(doSetCreatureOutfit, 2050, cid, _ORC_RIDER_OUTFIT, -1)
		doCreatureSetNoMove(cid, false)
		_DEATH_RAISED[cid] = 2
		doChangeSpeed(cid, _SPEED_RATE * getCreatureBaseSpeed(cid))
	else
		doPlayerSendCancel(cid, "You can only control War Wolves.")
		return FALSE
	end

	return doCombat(cid, combat, var)
end