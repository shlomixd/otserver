local holyBlastWaveArea = {

	createCombatArea({
		{3}
	}),
	
	createCombatArea({
		{3}
	}),
	
	createCombatArea({
		{1, 2, 1}
	}),
	
	createCombatArea({
		{0, 2, 0},
		{1, 0, 1}
	}),
	
	createCombatArea({
		{0, 2, 0},
		{0, 0, 0},
		{1, 0, 1}
	}),
	
	createCombatArea({
		{2},
		{0},
		{1}
	}),
	
	createCombatArea({
		{1, 3, 1},
		{1, 0, 1},
		{1, 1, 1}
	}),
	
	createCombatArea({
		{0, 0, 1, 1, 1, 0, 0},
		{0, 1, 1, 1, 1, 1, 0},
		{1, 1, 0, 3, 0, 1, 1},
		{1, 1, 1, 0, 1, 1, 1},
		{1, 1, 0, 1, 0, 1, 1},
		{0, 1, 1, 1, 1, 1, 0},
		{0, 0, 1, 1, 1, 0, 0}
	}),
	
	createCombatArea({
		{1, 3, 1},
		{1, 0, 1},
		{1, 1, 1}
	}),
	
	createCombatArea({
		{3}
	}),
	
	createCombatArea({
		{1, 3, 1}
	}),
	
	createCombatArea({
		{1},
		{1},
		{1},
		{1},
		{1},
		{1},
		{1},
		{1},
		{3}
	}),
	
	createCombatArea({
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 0, 1},
		{1, 2, 1}
	}),
	
	createCombatArea({
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 0, 0, 1},
		{1, 0, 2, 0, 1}
	})
}


local holyBlastWave = {}

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 5) * 8) + (level * 10)), -(((skill + 5) * 8) + (level * 10))
end

for k, area in ipairs(holyBlastWaveArea) do
	holyBlastWave[k] = createCombatObject()
	setCombatParam(holyBlastWave[k], COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(holyBlastWave[k], COMBAT_PARAM_EFFECT, 39)
	
	
	_G["callback1" .. k] = onGetFormulaValues
	setCombatCallback(holyBlastWave[k], CALLBACK_PARAM_SKILLVALUE, "callback1" .. k)
 
	setCombatArea(holyBlastWave[k], area)
end

local function castSpellDelay(p)
	doCombat(unpack(p))
end

function onCastSpell(cid, var)
	for k, area in ipairs(holyBlastWave) do
		addEvent(castSpellDelay, 250 * k, {cid, holyBlastWave[k], var})
	end
	return LUA_NO_ERROR
end