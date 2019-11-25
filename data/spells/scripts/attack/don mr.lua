local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
 
function onCastSpell(cid, var)
	doPlayerAddMana(cid, 140000000)
       doCreatureSay(cid, "Don MR!", TALKTYPE_ORANGE_1)
	return doCombat(cid, combat, var)
end