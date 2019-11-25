function onSay(cid, words, param, channel)
local interval = 1800 -- How big is globalevent shop cooldown?
local nextwave = (getGlobalStorageValue(964583) + interval) - os.time()
if math.floor(nextwave/60) > 1 then
doPlayerSendTextMessage(cid, 6, "IF you have purchased donation items you will get them in "..math.floor(nextwave/60).." minutes IF you are online then.")
elseif math.floor(nextwave/60) == 1 then
doPlayerSendTextMessage(cid, 6, "IF you have purchased donation items you will get them in less than 2 minutes IF you are online then.")
elseif math.floor(nextwave/60) == 0 then
doPlayerSendTextMessage(cid, 6, "IF you have purchased donation items you will get them in less than 1 minute IF you are online then.")
end
return true
end -- onsay function end.
