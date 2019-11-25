local repeatAmount = 3
 
 
local deathFlamesArea = {
    createCombatArea({
        {0, 1, 0},
        {1, 2, 1},
        {0, 1, 0}
    }),
    createCombatArea({
        {0, 1, 1, 1, 0},
        {1, 1, 0, 1, 1},
        {1, 0, 2, 0, 1},
        {1, 1, 0, 1, 1},
        {0, 1, 1, 1, 0}
    }),
    createCombatArea({
        {0, 0, 1, 1, 1, 0, 0},
        {0, 1, 0, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 2, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1},
        {0, 1, 0, 0, 0, 1, 0},
        {0, 0, 1, 1, 1, 0, 0}
    })
 
}
 
local bigFlamesArea = createCombatArea({
    {0, 0, 1, 1, 1, 1, 1, 0, 0},
    {0, 1, 1, 0, 0, 0, 1, 1, 0},
    {1, 1, 0, 0, 0, 0, 0, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 2, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 0, 0, 0, 0, 0, 1, 1},
    {0, 1, 1, 0, 0, 0, 1, 1, 0},
    {0, 0, 1, 1, 1, 1, 1, 0, 0}
})
 
local deathFlames = {}
for k, area in ipairs(deathFlamesArea) do
    deathFlames[k] = createCombatObject()
    setCombatParam(deathFlames[k], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    setCombatParam(deathFlames[k], COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKE)
    setCombatFormula(deathFlames[k], COMBAT_FORMULA_LEVELMAGIC, -12.593, -50, -13.929, -100)
 
    setCombatArea(deathFlames[k], area)
end
 
local bigFlames = createCombatObject()
setCombatParam(bigFlames, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(bigFlames, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatFormula(bigFlames, COMBAT_FORMULA_LEVELMAGIC, -13.766, -50, -12.241, -100)
 
setCombatArea(bigFlames, bigFlamesArea)
 
function onTargetTile(cid, pos)
    doSendDistanceShoot(getCreaturePosition(cid), pos, CONST_ANI_WHIRLWINDAXE)
end
setCombatCallback(bigFlames, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
 
local function castSpellDelay(p)
    if(isCreature(p[1]) == TRUE) then
        doCombat(unpack(p))
    end
end
 
function onCastSpell(cid, var)
    for i = 0, repeatAmount - 1 do
        for k, combat in ipairs(deathFlames) do
            addEvent(castSpellDelay, (150 * k) + #deathFlames * 150 * i + 700 * i, {cid, combat, var})
        end
        addEvent(castSpellDelay, (150 * #deathFlames) + #deathFlames * 150 * i + 700 * i, {cid, bigFlames, var})
    end
 
    return LUA_NO_ERROR
end  
