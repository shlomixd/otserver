local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
 
function onCastSpell(cid, var)
		doCreatureAddHealth(cid, 60000000)
		doCreatureAddMana(cid, 60000000)
		doCreatureSay(cid, "Mixed Rune!", TALKTYPE_ORANGE_1)
	return doCombat(cid, combat, var)
end