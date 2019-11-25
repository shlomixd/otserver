function onStepIn(cid, item, pos, fromPos)
 
   local timetoreset = 10 --10 seconds
    if item.actionid == 4021 then
     if (isPlayer(cid)) then
        doTransformItem(item.uid, 407) --407 = BlackTileID, edit it for another tileID if you want
        addEvent(resetgoodtile, timetoreset * 1000, item, pos)
      end
    end
end
 
function resetgoodtile(item, pos)
doItemSetAttribute(doCreateItem(406, 1, pos), "aid", 4021)
end