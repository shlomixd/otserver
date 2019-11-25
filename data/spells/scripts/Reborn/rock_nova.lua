local repeatAmount = 2

local rockNovaWaveArea = {
	
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
		{0, 1, 1, 1, 1, 1, 0},
		{1, 1, 0, 0, 0, 1, 1},
		{1, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 2, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 1},
		{1, 1, 0, 0, 0, 1, 1},
		{0, 1, 1, 1, 1, 1, 0}
	}),
	
	createCombatArea({
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
		{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
		{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
		{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
	})
}


function onTargetTile1(cid, pos)
	doSendDistanceShoot(getCreaturePosition(cid), pos, 10)
end

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 12) * 15) + (level * 30)), -(((skill + 12) * 15) + (level * 30))
end

local rockNovaWave = {}

for k, area in ipairs(rockNovaWaveArea) do
	rockNovaWave[k] = createCombatObject()
	setCombatParam(rockNovaWave[k], COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
	setCombatParam(rockNovaWave[k], COMBAT_PARAM_EFFECT, 44)

	setCombatArea(rockNovaWave[k], area)
	
	_G["callback1" .. k] = onTargetTile1
	setCombatCallback(rockNovaWave[k], CALLBACK_PARAM_TARGETTILE, "callback1" .. k)
	
	_G["callback2" .. k] = onGetFormulaValues
	setCombatCallback(rockNovaWave[k], CALLBACK_PARAM_SKILLVALUE, "callback2" .. k)
end

local function castSpellDelay(p)
	doCombat(unpack(p))
end

function onCastSpell(cid, var)
	for i = 0, repeatAmount - 1 do
		for k, area in ipairs(rockNovaWave) do
			addEvent(castSpellDelay, 500 * k + 2250 * i, {cid, rockNovaWave[k], var})
		end
	end
	return LUA_NO_ERROR
end