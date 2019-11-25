local arr = {}
 
arr[1] = {
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
	{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
	{1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1},
	{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
	{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
 
arr[2] = {
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 0, 0, 1, 0, 0},
	{0, 1, 0, 0, 0, 0, 0, 1, 0},
	{1, 0, 0, 0, 2, 0, 0, 0, 1},
	{0, 1, 0, 0, 0, 0, 0, 1, 0},
	{0, 0, 1, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
}
 
arr[3] = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 1, 0, 0, 0, 1, 0},
	{1, 0, 0, 2, 0, 0, 1},
	{0, 1, 0, 0, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}
 
arr[4] = {
	{0, 0, 1, 0, 0},
	{0, 1, 0, 1, 0},
	{1, 0, 2, 0, 1},
	{0, 1, 0, 1, 0},
	{0, 0, 1, 0, 0}
}
 
arr[5] = {
	{0, 1, 0},
	{1, 2, 1},
	{0, 1, 0}
}
 
arr[6] = {
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
 
local formulas = {
	[6] = {COMBAT_FORMULA_LEVELMAGIC, -5.0, -200, -5.2, -400}
}
 
local function onTileComb(cid, pos)
	if(isCreature(cid) == TRUE) then
		doSendDistanceShoot(pos, getThingPos(cid), CONST_ANI_SMALLHOLY)
	end
end
 
local combats = {}
for i, v in pairs(arr) do
	combats[i] = createCombatObject()
	setCombatParam(combats[i], COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	if(i < #arr) then
		_G["callback" .. i] = onTileComb --Mwahaha
		setCombatCallback(combats[i], CALLBACK_PARAM_TARGETTILE, "callback" .. i)
	else
		setCombatParam(combats[i], COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
	end
 
	if(formulas[i] ~= nil) then
		setCombatFormula(combats[i], unpack(formulas[i]))
	end
 
	setCombatArea(combats[i], createCombatArea(v))
end
 
local isCharging = {}
local function eventFunc(p)
	local cid = p.cid
	local n = p.n or 1
 
	if(isCreature(cid) == FALSE) then
		isCharging[cid] = false
		return LUA_ERROR
	end
 
	if(isCharging[cid] and n == 1) then
		if(isPlayer(cid) == TRUE) then
			doPlayerSendCancel(cid, "You are already charging it.")
		end
		return LUA_ERROR
	end
 
	isCharging[cid] = (n < #combats)
 
	local pos = getThingPos(cid)
	if(getTilePzInfo(pos) ~= FALSE) then
		isCharging[cid] = false
		return LUA_ERROR
	end
 
	local var = positionToVariant(pos)
	if(doCombat(cid, combats[n], var) == LUA_ERROR) then
		isCharging[cid] = false
		return LUA_ERROR
	end
 
	if(isCharging[cid]) then
		addEvent(eventFunc, 1000-n*100, {cid=cid, n=n+1})
	end
	return LUA_NO_ERROR
end
 
function onCastSpell(cid, var)
	return eventFunc({cid=cid})
end