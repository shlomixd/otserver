function onSay(cid, words, param)
local cost = 10000
local item = 1988
local quantity = 1
if doPlayerRemoveMoney(cid, cost) == TRUE then
doPlayerAddItem(cid, item, quantity)
else
doPlayerSendCancel(cid, "You have not enough gold.")
end
return TRUE
end