-----------------This Spell was made with Mindrage's Spell Maker v0.56b ---------
--Do not post the spells in any forum without this line or you will be caught!---
--This Software is free to use and can't be for for real-life values!------------
local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, 4)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0, -90000, 0, -95000)
--=======================================================================
local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, 512)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 22)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0,  -55000, 0, -75000)
--=======================================================================
local combat3 = createCombatObject() 
setCombatParam(combat3, COMBAT_PARAM_TYPE, 1024)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 41)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0,  -200000, 0, -300000)
--=======================================================================
local combat4 = createCombatObject() 
setCombatParam(combat4, COMBAT_PARAM_TYPE, 8)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 42)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0,  -250000,  0, -300000)
--=======================================================================




local area1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}
--=======================================
local area2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}
--=======================================
local area3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}
--=======================================
local area4 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 1, 2, 0, 0, 1, 0, 0, 0},
{0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0},
{1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0},
{1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0}}
--=======================================




setCombatArea(combat1, createCombatArea(area1))
setCombatArea(combat2, createCombatArea(area2))
setCombatArea(combat3, createCombatArea(area3))
setCombatArea(combat4, createCombatArea(area4))



function onCastSpell(cid, var)
addEvent(doCombat, 100, cid, combat1, var)
addEvent(doCombat, 90, cid, combat2, var)
addEvent(doCombat, 80, cid, combat3, var)
addEvent(doCombat, 50, cid, combat4, var)
return TRUE
end
