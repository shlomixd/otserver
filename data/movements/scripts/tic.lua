dofile('./data/Phases.lua') --<< line 1 script started
 
 
function onRemoveItem(moveItem, tileItem, position, cid)
 local returnplace = ( moveItem.itemid == 6556 and config_tic[1].token_pos or config_tic[2].token_pos ) 
	if cid > 0 then
 
		if getStorage(running_token) > 0 then
 
 
			if doComparePositions(position,config_tic[1].token_pos) or doComparePositions(position,config_tic[2].token_pos) then
 
				if getStorage(canMove_token) == 0 then
					return doPlayerSendCancel(cid,"Sorry, you can't move your token now.") and doSendMagicEffect(returnplace,2) and doTeleportThing(moveItem.uid,returnplace)
				end
 
				if getStorage(turn_tocken) ~=  getPlayerStorageValue(cid,turn_id_tocken) then
					return doSendMagicEffect(returnplace,2) and doPlayerSendCancel(cid,"Sorry, this isn't your turn.") and doTeleportThing(moveItem.uid,returnplace)
				end
 
				local p = getThingPosition(moveItem.uid)
				local f = moveItem.itemid
 
				if not isInRange(p,tic_pos.frompos,tic_pos.topos) then 
					return doSendMagicEffect(returnplace,2) and doTeleportThing(moveItem.uid,returnplace) and doPlayerSendCancel(cid,"You can't move the token outside play zone.")
				end
 
				if isWinner(cid) then
					doSetStorage(canMove_token,0)
					addEvent(gatherTokens,6700,tic_pos.frompos,tic_pos.topos, config_tic[1].token_pos , config_tic[2].token_pos)
					addEvent(getRefree,7000,cid)
				else
					if endPoint(tic_pos.frompos,tic_pos.topos) then
						doSetStorage(canMove_token,0)
						gatherTokens(tic_pos.frompos,tic_pos.topos, config_tic[1].token_pos , config_tic[2].token_pos)
						addEvent(getRefree,200,cid,1)
						doSetStorage(turn_tocken, math.random(1,2) )
					else
						doSetStorage(turn_tocken, ( getStorage(turn_tocken) == 1 and 2 or 1 ) )
					end
				end
			end
 
		else
			return doSendMagicEffect(returnplace,2) and doTeleportThing(moveItem.uid,returnplace) and doPlayerSendCancel(cid,"Game not started.")
		end
 
	end
 
	return true
end
 
function onAddItem(moveItem, tileItem, position, cid)
	if cid > 0 then
		local check = false
		for i = tic_pos.frompos.x, tic_pos.topos.x do 
			for j = tic_pos.frompos.y, tic_pos.topos.y do 
				local pos = {x = i, y=j,z=tic_pos.frompos.z}
				if doComparePositions(position,pos) then
					check = true
					break
				end
			end
		end
		if not isInArray({6556,6557},moveItem.itemid) then
			local count = moveItem.type
			if not isContainer(moveItem.uid) then
				doRemoveItem(moveItem.uid)
				doPlayerAddItem(cid,moveItem.itemid,count)
				doPlayerSendCancel(cid,"You can't drop your item here.")
				doSendMagicEffect(getThingPos(cid),2)
			else
				local uids = moveItem
				local bp = doPlayerAddItem(cid,uids.itemid,1)
				doAddCopiedContainer(uids, bp)
				return doRemoveItem(moveItem.uid) and doPlayerSendCancel(cid,"You can't drop your item here.") and doSendMagicEffect(getThingPos(cid),2)
			end
		else
			if check == false then
				doRemoveItem(moveItem.uid)
			end
		end
	end
	return true
end