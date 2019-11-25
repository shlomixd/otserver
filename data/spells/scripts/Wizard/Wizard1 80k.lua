-----------------This Spell was made with Mindrage's Spell Maker v0.56b ---------
--Do not post the spells in any forum without this line or you will be caught!---
--This Software is free to use and can't be for for real-life values!------------
local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, 2)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 3)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC,  0, -250000,  0, -400000)
--=======================================================================
local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, 1024)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC,  0, -250000,  0, -350000)
--=======================================================================
local combat3 = createCombatObject() 
setCombatParam(combat3, COMBAT_PARAM_TYPE, 1)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 6)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC,  0, -250000,  0, -360000)
--=======================================================================
local combat4 = createCombatObject() 
setCombatParam(combat4, COMBAT_PARAM_TYPE, 1)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 8)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC,  0, -250000,  0, -380000)
--=======================================================================




local area1 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 1, 0, 0, 0, 3, 0, 0, 0, 0, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1}}
--=======================================
local area2 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 1, 1, 0, 1, 1, 3, 1, 1, 0, 1, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}}
--=======================================
local area3 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1},
{1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0},
{0, 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}}
--=======================================
local area4 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 1, 1, 0, 3, 0, 0, 1, 0, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0}}
--=======================================




setCombatArea(combat1, createCombatArea(area1))
setCombatArea(combat2, createCombatArea(area2))
setCombatArea(combat3, createCombatArea(area3))
setCombatArea(combat4, createCombatArea(area4))



function onCastSpell(cid, var)
addEvent(doCombat, 100, cid, combat1, var)
addEvent(doCombat, 100, cid, combat2, var)
addEvent(doCombat, 100, cid, combat3, var)
addEvent(doCombat, 100, cid, combat4, var)
return TRUE
end
