local cfg = 
{ 
    level = 10000,
    itemid = 6547,
    newMana = 100000
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == cfg.itemid) then
        if getPlayerLevel(cid) >= cfg.level then  
            setCreatureMaxMana(cid, (getCreatureMaxMana(cid)+cfg.newMana))
            doSendAnimatedText(getCreaturePosition(cid), "MANA!",TEXTCOLOR_RED)
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
            doCreatureSay(cid, "You have recieved ".. cfg.newMana .." extra mana points, now your mana is ".. getCreatureMaxMana(cid) .."!", TALKTYPE_ORANGE_1)  
            doRemoveItem(item.uid)  
        else  
            doPlayerSendCancel(cid, "Your level is not high enough.")  
        end
        return TRUE
    end
end  