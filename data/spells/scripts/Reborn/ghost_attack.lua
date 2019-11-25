local ghostWaveArea = {
	createCombatArea({
		{1, 0, 0, 0, 0, 0, 1},
		{0, 1, 0, 0, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 2, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 1, 0, 0, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1}
	}),

	createCombatArea({
		{1, 0, 0, 0, 1},
		{0, 1, 0, 1, 0},
		{1, 0, 2, 0, 1},
		{0, 1, 0, 1, 0},
		{1, 0, 0, 0, 1}
	}),

	createCombatArea({
		{1, 0, 1},
		{0, 2, 0},
		{1, 0, 1}
	}),

	createCombatArea({
		{1, 1, 1},
		{1, 2, 1},
		{1, 1, 1}
	}),

	createCombatArea({
		{0, 1, 1, 1, 1, 1, 0},
		{1, 1, 0, 1, 0, 1, 1},
		{1, 0, 0, 1, 0, 0, 1},
		{1, 1, 1, 2, 1, 1, 1},
		{1, 0, 0, 1, 0, 0, 1},
		{1, 1, 0, 1, 0, 1, 1},
		{0, 1, 1, 1, 1, 1, 0}
	}),

	createCombatArea({
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0},
		{1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1},
		{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
		{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
		{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
		{1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1},
		{0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}
	}),

	createCombatArea({
		{0, 1, 1},
		{1, 1, 0},
		{1, 0, 2}
	}),

	createCombatArea({
		{1, 1, 0},
		{0, 1, 1},
		{2, 0, 1}
	}),

	createCombatArea({
		{2, 0, 1},
		{0, 1, 1},
		{1, 1, 0}
	}),

	createCombatArea({
		{1, 0, 2},
		{1, 1, 0},
		{0, 1, 1}
	}),

	createCombatArea({
		{0, 0, 0, 1, 1, 1, 1},
		{0, 0, 1, 0, 0, 0, 1},
		{0, 1, 1, 1, 1, 1, 0},
		{1, 0, 1, 0, 0, 0, 0},
		{1, 0, 1, 0, 0, 0, 0},
		{1, 0, 1, 0, 0, 0, 0},
		{1, 1, 0, 0, 0, 0, 2}
	}),

	createCombatArea({
		{1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 0, 0},
		{1, 1, 1, 1, 1, 1, 0},
		{0, 0, 0, 0, 1, 0, 1},
		{0, 0, 0, 0, 1, 0, 1},
		{0, 0, 0, 0, 1, 0, 1},
		{2, 0, 0, 0, 1, 0, 1}
	}),

	createCombatArea({
		{2, 0, 0, 0, 1, 0, 1},
		{0, 0, 0, 0, 1, 0, 1},
		{0, 0, 0, 0, 1, 0, 1},
		{0, 0, 0, 0, 1, 0, 1},
		{1, 1, 1, 1, 1, 1, 0},
		{0, 0, 0, 0, 1, 0, 0},
		{1, 1, 1, 1, 0, 0, 0}
	}),

	createCombatArea({
		{1, 0, 1, 0, 0, 0, 2},
		{1, 0, 1, 0, 0, 0, 0},
		{1, 0, 1, 0, 0, 0, 0},
		{1, 0, 1, 0, 0, 0, 0},
		{0, 1, 1, 1, 1, 1, 1},
		{0, 0, 1, 0, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1}
	}),

	createCombatArea({
		{0, 1, 1},
		{1, 1, 0},
		{1, 0, 2}
	}),

	createCombatArea({
		{1, 1, 0},
		{0, 1, 1},
		{2, 0, 1}
	}),

	createCombatArea({
		{2, 0, 1},
		{0, 1, 1},
		{1, 1, 0}
	}),

	createCombatArea({
		{1, 0, 2},
		{1, 1, 0},
		{0, 1, 1}
	})
}



function onTargetTile1(cid, pos)
	doSendDistanceShoot(getCreaturePosition(cid), pos, 30)
end

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 7) * 9) + (level * 15)), -(((skill + 7) * 9) + (level * 15))
end

local ghostWave = {}
for k, area in ipairs(ghostWaveArea) do
	ghostWave[k] = createCombatObject()
	setCombatParam(ghostWave[k], COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	setCombatParam(ghostWave[k], COMBAT_PARAM_EFFECT, 65)

	setCombatArea(ghostWave[k], area)

	_G["callback1" .. k] = onTargetTile1
	setCombatCallback(ghostWave[k], CALLBACK_PARAM_TARGETTILE, "callback1" .. k)
	
	_G["callback2" .. k] = onGetFormulaValues
	setCombatCallback(ghostWave[k], CALLBACK_PARAM_SKILLVALUE, "callback2" .. k)
end

local function castSpellDelay(p)
	doCombat(unpack(p))
end

function onCastSpell(cid, var)
	for k, area in ipairs(ghostWave) do
		addEvent(castSpellDelay, 500 * k, {cid, ghostWave[k], var})
	end
	return LUA_NO_ERROR
end