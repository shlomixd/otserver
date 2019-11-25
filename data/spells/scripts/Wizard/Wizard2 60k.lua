-----------------This Spell was made with Mindrage's Spell Maker v0.56b ---------
--Do not post the spells in any forum without this line or you will be caught!---
--This Software is free to use and can't be for for real-life values!------------
local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, 512)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 31)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 4)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC,  0, -50000,  0, -70000)
--=======================================================================
local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, 4)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 41)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 5)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC,  0, -56000,  0, -77000)
--=======================================================================




local area1 = {
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1},
{1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1},
{1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1},
{1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1},
{1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1},
{1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1},
{1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0}}
--=======================================
local area2 = {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}}
--=======================================




setCombatArea(combat1, createCombatArea(area1))
setCombatArea(combat2, createCombatArea(area2))



function onCastSpell(cid, var)
addEvent(doCombat, 0, cid, combat1, var)
addEvent(doCombat, 0, cid, combat2, var)
return TRUE
end