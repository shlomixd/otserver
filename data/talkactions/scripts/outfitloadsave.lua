local storageOutfitSave = 666777
function doPlayerLoadOutfit(cid)
    local loadData = tostring(getCreatureStorage(cid, storageOutfitSave)) or "false"
    local outfit = loadstring("return " .. loadData)()
    return type(outfit) == "table" and doCreatureChangeOutfit(cid, outfit)
end
function doPlayerSaveOutfit(cid)
    local saveData = "{"
    for key, value in pairs(getCreatureOutfit(cid)) do
        saveData = string.format("%s%s=%u,", saveData, key, value)
    end
    return doCreatureSetStorage(cid, storageOutfitSave, saveData .. "}")
end
function onSay(cid, words, param, channel)
    if param == "save" then
        doPlayerSaveOutfit(cid)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have saved the outfit successfully.")
    elseif param == "load" then
        if doPlayerLoadOutfit(cid) then
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_BLUE)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have loaded the outfit successfully.")
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have any outfit stored.")
        end
    end
    return true
end