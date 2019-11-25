local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

local reborn = 2500 -- free storage
local spellReborn = {
	[1] = 'Reborn1',
	[5] = 'Reborn5',
	[10] = 'Reborn10',
	[25] = 'Reborn25',
	[50] = 'Reborn50',
	[100] = 'Reborn100',
	[250] = 'Reborn250',
	[500] = 'Reborn500'
}
local level = 717217
local maxReborns = 120
local toLevel = 100

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end

function greetCallback(cid)
	Topic[cid] = nil
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif Topic[cid] then
		if msgcontains(msg, 'yes') then
			if getCreatureStorage(cid, reborn) < maxReborns then
				doCreatureSetStorage(cid, reborn, math.max(0, getCreatureStorage(cid, reborn)) + 1)
				for k, v in pairs(spellReborn) do
					if getCreatureStorage(cid, reborn) == k then
						doPlayerLearnInstantSpell(cid, v)
						doSendMagicEffect(getThingPosition(cid), CONST_ME_FIREWORK_RED)
						break
					end
				end
				
				local g = getPlayerGUID(cid)
				npcHandler:releaseFocus(cid)
				doRemoveCreature(cid)
				db.executeQuery('UPDATE players SET level=99,experience=15219400 WHERE id=' .. g)
			else
				npcHandler:say('You reached maximum amount of reborns.', cid)
			end
		else
			npcHandler:say('Maybe next time.', cid)
		end
		Topic[cid] = nil
	else
		if msgcontains(msg, 'reborn') then
			if getPlayerLevel(cid) >= level then
				npcHandler:say('Are you sure that you want to make reborn?',cid)
				Topic[cid] = 1
			else
				npcHandler:say('You don\'t have enough level. ['..level..']',cid)
				Topic[cid] = nil
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())