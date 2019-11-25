local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 17)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.3, -999999999, -3, -999999999)
 
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 5)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.3, -999999999, -3, -999999999)
 
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.3, -999999999, -3, -999999999)
 
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 39)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -2.3, -999999999, -3, -999999999)
 
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 34)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -2.3, -999999999, -3, -999999999)
 
arr1 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}
 
arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 2, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
 
local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, combat3, parameters.var)
end
 
local function onCastSpell4(parameters)
    doCombat(parameters.cid, combat4, parameters.var)
end
 
local function onCastSpell5(parameters)
    doCombat(parameters.cid, combat5, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell3, 100, parameters)
addEvent(onCastSpell4, 100, parameters)
addEvent(onCastSpell5, 100, parameters)
 
end