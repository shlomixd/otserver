local repeatAmount = 2

local iceNovaWaveArea = {
	
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
	doSendDistanceShoot(getCreaturePosition(cid), pos, 28)
end

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 10) * 10) + (level * 20)), -(((skill + 10) * 10) + (level * 20))
end

local iceNovaWave = {}

for k, area in ipairs(iceNovaWaveArea) do
	iceNovaWave[k] = createCombatObject()
	setCombatParam(iceNovaWave[k], COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	setCombatParam(iceNovaWave[k], COMBAT_PARAM_EFFECT, 52)

	setCombatArea(iceNovaWave[k], area)
	
	_G["callback1" .. k] = onTargetTile1
	setCombatCallback(iceNovaWave[k], CALLBACK_PARAM_TARGETTILE, "callback1" .. k)
	
	_G["callback2" .. k] = onGetFormulaValues
	setCombatCallback(iceNovaWave[k], CALLBACK_PARAM_SKILLVALUE, "callback2" .. k)
end

local function castSpellDelay(p)
	doCombat(unpack(p))
end

function onCastSpell(cid, var)
	for i = 0, repeatAmount - 1 do
		for k, area in ipairs(iceNovaWave) do
			addEvent(castSpellDelay, 500 * k + 2250 * i, {cid, iceNovaWave[k], var})
		end
	end
	return LUA_NO_ERROR
end