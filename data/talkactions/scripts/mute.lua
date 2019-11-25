string.explode = function (str, sep) local pos, t = 1, {} if #sep == 0 or #str == 0 then return end for s, e in function() return str:find(sep, pos) end do table.insert(t, str:sub(pos, s - 1):trim()) pos = e + 1 end table.insert(t, str:sub(pos):trim()) return t end
local conditions = {}
for i = 1, 100 do
	table.insert(conditions, createConditionObject(CONDITION_MUTED))
	setConditionParam(conditions[i], CONDITION_PARAM_TICKS, i * 60000)
end

function onSay(cid, words, param)
	if getPlayerGroupId(cid) < 2 then
		return FALSE
	end
	local t = string.explode(param, ",")
	local target = getPlayerByName(t[1])
	if param == '' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires a player name and a number of minutes.")
	elseif getPlayerGroupId(target) > 1 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot mute another staff member.")
	elseif isPlayer(target) ~= TRUE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player is not online.")
	elseif t[2] > #conditions then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot mute players for more than " .. #conditions .. " minutes.")
	else
		doAddCondition(target, conditions[tonumber(t[2])])
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have muted " .. getCreatureName(target) .. " for "..t[2].." minutes.")
		doSendMagicEffect(getThingPos(target), CONST_ME_SLEEP)
	end
	return TRUE
end