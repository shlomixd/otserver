local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HEARTS) 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true) 
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false) 
 
function onCastSpell(cid, var) 
    local life = getCreatureMaxHealth(cid) 
    doCreatureAddHealth(cid, life)
    return doCombat(cid, combat, var) 
end