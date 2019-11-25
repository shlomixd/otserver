local earthQuakeWaveArea = {

	createCombatArea({
		{0, 1, 0},
		{1, 2, 1},
		{0, 1, 0}
	}),

	createCombatArea({
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 1, 2, 1, 1},
		{0, 1, 1, 1, 0},
		{0, 0, 1, 0, 0}
	}),

	createCombatArea({
		{0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 1, 0, 1, 0, 1, 0, 0, 0},
		{1, 1, 1, 2, 1, 1, 1, 0, 0},
		{0, 1, 0, 1, 0, 1, 0, 0, 0},
		{0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0, 0, 0}
	}),

	createCombatArea({
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
		{1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
		{0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
	}),

	createCombatArea({
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
		{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
		{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
	}),

	createCombatArea({
		{1, 1, 1},
		{1, 2, 1},
		{1, 1, 1}
	}),

	createCombatArea({
		{1, 1, 0, 1, 1},
		{1, 1, 0, 1, 1},
		{0, 0, 2, 0, 0},
		{1, 1, 0, 1, 1},
		{1, 1, 0, 1, 1}
	}),

	createCombatArea({
		{1, 1, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 1, 1},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{1, 1, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 1, 1}
	}),

	createCombatArea({
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{0, 0, 1, 0, 0, 0, 1, 0, 0},
		{0, 0, 0, 1, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 2, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 1, 0, 0, 0},
		{0, 0, 1, 0, 0, 0, 1, 0, 0},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 1, 1}
	}),

	createCombatArea({
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
		{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
		{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
		{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1}
	})
}

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 4) * 6) + (level * 9)), -(((skill + 4) * 6) + (level * 9))
end

local earthQuakeWave = {}
for k, area in ipairs(earthQuakeWaveArea) do
	earthQuakeWave[k] = createCombatObject()
	setCombatParam(earthQuakeWave[k], COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
	setCombatParam(earthQuakeWave[k], COMBAT_PARAM_EFFECT, 34)

	setCombatArea(earthQuakeWave[k], area)
	
	_G["callback1" .. k] = onGetFormulaValues
	setCombatCallback(earthQuakeWave[k], CALLBACK_PARAM_SKILLVALUE, "callback1" .. k)
end

local function castSpellDelay(p)
	doCombat(unpack(p))
end

function onCastSpell(cid, var)
	for k, area in ipairs(earthQuakeWave) do
		addEvent(castSpellDelay, 400 * k, {cid, earthQuakeWave[k], var})
	end
	return LUA_NO_ERROR
end