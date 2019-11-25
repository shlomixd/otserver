local config = {
	positions = {
		["Teleports"] = { x = 996, y = 904, z = 7 },
		["Games Room"] = { x = 996, y = 902, z = 7 },
		["Trainers"] = { x = 1008, y = 902, z = 7 },
	},

	effects = {
		CONST_ME_MAGIC_BLUE,
		CONST_ME_MAGIC_GREEN,
		CONST_ME_MORTAREA,
		CONST_ME_FIREWORK_RED,
		CONST_ME_YELLOW_RINGS,
		CONST_ANI_ENERGYBALL,
		CONST_ME_HOLYDAMAGE,
		CONST_ME_YELLOWENERGY,
		CONST_ME_PURPLEENERGY
	},

	colors = {
		TEXTCOLOR_WHITE,
		TEXTCOLOR_PLATINUMBLUE,
		TEXTCOLOR_ORANGE,
		TEXTCOLOR_GREEN,
		TEXTCOLOR_PURPLE,
		TEXTCOLOR_BLUE
	}
}

function onThink(cid, interval, lastExecution)
	for text, pos in pairs(config.positions) do
		doSendMagicEffect(pos, config.effects[math.random(1, #config.effects)])
		doSendAnimatedText(pos, text, config.colors[math.random(1, #config.colors)])
             end
              return LUA_NO_ERROR
               end