local cfg = 
{ 
    level = 10000,
    itemid = 6548,
    newHealth = 100000
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == cfg.itemid) then
        if getPlayerLevel(cid) >= cfg.level then  
            setCreatureMaxHealth(cid, (getCreatureMaxHealth(cid)+cfg.newHealth))
            doSendAnimatedText(getCreaturePosition(cid), "HEALTH!",TEXTCOLOR_RED)
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
            doCreatureSay(cid, "You have recieved ".. cfg.newHealth .." extra health points, now your health is ".. getCreatureMaxHealth(cid) .."!", TALKTYPE_ORANGE_1)  
            doRemoveItem(item.uid)  
        else  
            doPlayerSendCancel(cid, "Your level is not high enough.")  
        end
        return TRUE
    end
end  