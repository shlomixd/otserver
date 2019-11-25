local gifts = {
        {10, 6531, 1}, -- 1% to get Santa Hat [10]
        {40, 2112, 1}, --  4% to get Teddy Bear [40]
        {100, 2160, 10}, -- 10% to get 10 Crystal Coins [100]
        {150, 2688, 10}, -- 15% to get 10 Candy Canes [150]
        {150, 2152, 100}, -- 15% to get 100 Platinum Coins [150]
        {200, 2111, 5}, -- 20% to get 10 Snowballs [200]
        {250, 2675, 10}, -- 25% to get 10 Orange [250]
        {350, 2674, 15}, -- 35% to get 10 Red Apples [350]
        {400, 6512, 1}, -- 40% to get Santa Doll [40]
    }

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)              npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                              npcHandler:onThink() end

function SantaNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.present == true) then
        if (getPlayerStorageValue(cid, PRESENT_STORAGE) == 1) then
      selfSay("You got your gift didnt you?!", cid)
      return true
  end

        local item = {}
        local reward = 0
        local count = ""
        for i = 1, #gifts do
            item = gifts[i]
            if (math.random(0,999) < item[1]) then
                reward = item[2]
                subType = item[3]
                if subType > 1 then
                    count = subType .. " "
                end
                break
            end
        end
        doPlayerAddItem(cid, reward, subType)
        setPlayerStorageValue(cid, PRESENT_STORAGE, 1)
        npcHandler:say('HO-HO-HO! I have ' .. count .. getItemNameById(reward) .. ' for you :).', cid)
    else
        npcHandler:say('Dont lie my little kid!', cid)
    end
    npcHandler:resetNpc()
    return true
end

npcHandler:setMessage(MESSAGE_GREET, "HO-HO-HO, Merry Christmas |PLAYERNAME|. Were you a good kid this year?!.")

local noNode = KeywordNode:new({'no'}, SantaNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, SantaNPC, {present = true})

local node = keywordHandler:addKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are you sure?'})
    node:addChildKeywordNode(yesNode)
    node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())