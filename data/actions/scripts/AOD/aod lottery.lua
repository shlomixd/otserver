local noob_item = {2280,2278,2263,2275,2646,2272,2160}  -- put here id of most items to be won
local semi_item = {2365,2523,2352,2272,2523,8931,3966,2272,2275}  -- put here id of semi won items
local best_item = {2312,2316,9778,9777,9776,8858,2433,2262,2272,2275,9020}   --put id of rare items
function onUse(cid, item, fromPosition, itemEx, toPosition)
   local r = math.random(100)
     local noob = noob_item[math.random(1, #noob_item)]
       local semi = semi_item[math.random(1, #semi_item)]
         local best =  best_item[math.random(1, #best_item)]
              if r >= 1 and r < 71 then
                   doPlayerAddItem(cid,noob,1)
                   doPlayerSendTextMessage(cid,25,"AOD Lottery : you have won ["..getItemNameById(noob)..".")
                   doSendMagicEffect(getThingPos(cid),27)
              elseif r >= 81 and r < 98 then
                   doPlayerAddItem(cid,semi,1)
                   doPlayerSendTextMessage(cid,25,"AOD Lottery : you have won ["..getItemNameById(semi)..".")
                   doSendMagicEffect(getThingPos(cid),27)
              elseif r >= 98 then
                   doPlayerAddItem(cid,best,1)
	               doSendMagicEffect(getThingPos(cid),27)
	               doPlayerSendTextMessage(cid,25,"AOD Lottery : you have won ["..getItemNameById(best)..".")
	               doBroadcastMessage("AOD Lottery : Congratulations! "..getCreatureName(cid).." have won a ["..getItemNameById(best).."].")
              end
   return doRemoveItem(item.uid)
end