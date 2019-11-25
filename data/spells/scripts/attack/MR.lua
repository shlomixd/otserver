local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onCastSpell(cid, var)
doPlayerAddMana(cid, 100000)
doCreatureSay(cid, "MR!", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end 