local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onCastSpell(cid, var)
doCreatureAddMana(cid, 1500000000)
doCreatureAddHealth(cid, 1500000000)
doCreatureSay(cid, "Don Mixed Rune!", TALKTYPE_ORANGE_1)
return doCombat(cid, combat, var)
end 