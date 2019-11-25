function onThink(interval, lastExecution)
    if (tonumber(os.date("%d")) ~= getGlobalStorageValue(23456)) then
        setGlobalStorageValue(23456, (tonumber(os.date("%d"))))
    end
    db.executeQuery("UPDATE `players` SET `onlinetimeall`=players.onlinetimeall+300 WHERE `online` = 1;")
    return TRUE
end
