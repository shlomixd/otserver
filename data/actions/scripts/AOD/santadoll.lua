-- Script by DJ Death and Fixed by Miisael para Blacktibia--
local t = {
[1] = {9020},
[2] = {6531},
[3] = {2112},
[4] = {2111},
[5] = {2688}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local v = t[math.random(1,5)]
if v then
doPlayerAddItem (cid,v[1],1)
doPlayerSendTextMessage(cid,22,"Ho Ho Ho! Merry CHRISTMAS.")
doSendAnimatedText(getPlayerPosition(cid), "Merry CHRISTMAS", math.random(1, 255))
doSendMagicEffect(getCreaturePosition(cid),12)
	doRemoveItem(item.uid, 1)
return TRUE
end
end