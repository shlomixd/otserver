
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
 
function onCastSpell(cid, var)
    doCreatureAddHealth(cid, 40000000)
	doCreatureSay(cid, "Healing Rune", TALKTYPE_ORANGE_1)
    return doCombat(cid, combat, var)
end