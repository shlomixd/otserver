local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local t = {}
 
local item = 9020 -- item id
local count = 120 -- count of itemID
local points = 2 -- amount of premium points
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'change') then
		selfSay('are you sure you want to change '.. count ..' of '.. getItemNameById(item) ..' for '.. points ..' premium points?', cid)
		t[cid] = 1
	elseif t[cid] == 1 then
		npcHandler:releaseFocus(cid)
		t[cid] = nil
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, item, count) then
				local p = "UPDATE `accounts` SET `premium_points` = `premium_points` + "..points.." where id="..getPlayerAccountId(cid)
				db.executeQuery(p)
				selfSay('you have recieved '.. points ..' premium points', cid)
			else
				selfSay('you don\'t have enough coins you need '.. count ..' of '.. getItemNameById(item) ..' to recieve '.. points ..' premium points', cid)
				end
			end
		end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())