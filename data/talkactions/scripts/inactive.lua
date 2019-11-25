local function getLastLoginDiff(name) 
local res = db.getResult("SELECT `lastlogin` FROM `players` WHERE `name` = '"..name.."';")
     if res:getID() ~= -1 then 
        return os.time()-res:getDataInt('lastlogin') 
    end 
end 

local config = { 
timeInDays = 14, 
buyHouseCommand = "!buyhouse", 
delay = 10, 
delayStorage = 49676 
} 

function onSay(cid, words, param, channel) 
    local pos,s,dir = getPlayerPosition(cid),getPlayerPosition(cid),getCreatureLookDirection(cid)
     if config.delay ~= 0 and getPlayerStorageValue(cid,config.delayStorage) >= os.time() then
         return doSendMagicEffect(pos,2) and doPlayerSendCancel(cid,"You can only use this command every " .. config.delay .. " seconds. You have to wait " .. getPlayerStorageValue(cid,config.delayStorage)-os.time() .. " seconds.")
     end 
    pos.x = dir == 1 and pos.x+1 or dir == 3 and pos.x-1 or pos.x 
    pos.y = dir == 0 and pos.y-1 or dir == 2 and pos.y+1 or pos.y 
    local abuse = config.delay ~= 0 and setPlayerStorageValue(cid,config.delayStorage,os.time()+config.delay)
      
    local house = getHouseFromPos(pos) 
    if house == false then 
        return doSendMagicEffect(s,2) and doPlayerSendCancel(cid,"This ain't a house tile.")
     end 
     
    if getHouseOwner(house) == 0 then 
        return doSendMagicEffect(s,2) and doPlayerSendCancel(cid,"This house has no owner. You can buy it on the normal way using " .. config.buyHouseCommand .. ".")
     end 
     
    local owner = getPlayerNameByGUID(getHouseOwner(house)) 
    if not(getLastLoginDiff(owner) >= config.timeInDays*24*60*60) then 
        return doSendMagicEffect(s,2) and doPlayerSendCancel(cid,owner.." is not inactive.")
     end 
     
    if doPlayerRemoveMoney(cid,getHousePrice(house)) then 
        return doSendMagicEffect(s,13) and setHouseOwner(house, getPlayerGUID(cid)) and doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,owner .. " has been inactive for more than " .. config.timeInDays .. " days.\nYou bought " .. getHouseName(house) .. " for " .. getHousePrice(house) .. ".")
     else 
        return doSendMagicEffect(s,2) and doPlayerSendCancel(cid,"You need "..getHousePrice(house).." gold coins to buy " .. getHouseName(house) .. ".")
     end 
end  
