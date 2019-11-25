-- config
local delay_time = 3
local dmg_min = 2000000
local dmg_max = 2000000
 
-- script
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
 
 
function C4check(cid, attacker, time)
	if(not isCreature(attacker) or not isCreature(cid)) then
		if(isCreature(cid)) then
			local pos = getThingPosition(cid)
			doSendAnimatedText(pos, "Miss", 18)
			doSendMagicEffect(pos, CONST_ME_POFF)
		end
		return
	end
	local pos = getThingPosition(cid)
	if(time > 0) then
		doSendAnimatedText(pos, time, 180)
		addEvent(C4check, 1000, cid, attacker, time - 1)
	else
		doTargetCombatHealth(attacker, cid, COMBAT_UNDEFINEDDAMAGE, -dmg_min, -dmg_max, CONST_ME_EXPLOSIONAREA)
	end
end
 
function onCastSpell(cid, var)
	local target = variantToNumber(var)
	if(isCreature(target) and doCombat(cid, combat, var)) then
		C4check(target, cid, delay_time)
		return true
	end
	return false
end