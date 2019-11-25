--[[
    ##*#*#*#*#*#*#*	••••	VVVVVVVVV	••••  #%#%#%#%#%#%#%
	#%#%#%#%#%#%#%* ••••	VVVVVVVVV	••••  #%#%#%#%#%#%#%	
  #$#%#%#%#%#%#%#%#	 <<		Tic-Tac-Tuc System 	>>  #$#$#$#$#$#$#$#$#
					 <<		By : Doggynub		>>
	#%#%#%#%#%#%#%	••••	^^^^^^^^^	••••  #%#%#%#%#%#%%#
	#%#%#%#%#%#%##% ••••	^^^^^^^^^   ••••  ##*#*#*#*#*#*#
 
	]]--
 
 
 
 
--// Editable ( you will just edit the stuff in editable zone) \\--  
 
turn_id_tocken = 328859 -- empty storage
 
turn_tocken = 325888 -- empty storage
 
canMove_token = 336888 -- empty storage
 
round_token = 339888 -- empty storage
 
winner_token = 338888 -- empty storage
 
running_token = 333445 -- empty storage
 
won_token = 323245 -- empty storage
 
ITem_WinnEr  = { {2160,100} , {2160,100} } -- {item,count} make sure non-stackable items would be with count 1 only
 
tic_pos = { 
				frompos = { x= 1323, y = 200, z = 0 }, 	-- start position of playing field
				topos = { x= 1336, y = 211, z = 0 } -- end position of playing field
			}
 
config_tic = { -- cross player starting pos on lever             ,    cross player pos in game          ,  storage for cross player  , 	cross token pos
					{ pos_start = { x= 1330, y = 200, z = 0 }  , pos_game = { x= 1332, y = 205, z = 0 } ,  storage = 52944 ,  token_pos = { x= 1332, y = 204, z = 0 } },
 
					-- circle player starting pos on lever              ,    circle player pos in game        ,  storage for circle player , 	circle token pos
					{pos_start = { x= 1328, y = 200, z = 0 }  , pos_game = { x= 1326, y = 207, z = 0 } , storage = 52949, token_pos = { x= 1326, y = 208, z = 0 } }
 
				}
 
 
 
 
--// End \\-- (Don't touch stuff down there)
 
 
 
 
 
 
 
Phases_Tic_Tac = { 
					-- // Horizontal raws \\--
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y, z = tic_pos.frompos.z } }, 
 
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } },
 
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } },
 
					-- // Vertical raws \\--
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } },
 
					{ {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } },
 
					{ {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } },
 
 
					--// Crosses raws \\--
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } },
 
					{ {x = tic_pos.frompos.x, y = tic_pos.frompos.y+2, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z } , {x = tic_pos.frompos.x+2, y = tic_pos.frompos.y, z = tic_pos.frompos.z } }
 
 
				}
 
 
function markWinningRaw(item, pos1, pos2, pos3, timer)--By Doggynub
	doRemoveItem(getTileItemById(pos1,item).uid)
	doRemoveItem(getTileItemById(pos2,item).uid)
	doRemoveItem(getTileItemById(pos3,item).uid)
	addEvent(doCreateItem,timer,item,1,pos1)
	addEvent(doCreateItem,timer,item,1,pos2)
	addEvent(doCreateItem,timer,item,1,pos3)
end
 
function turn()
	if getStorage(canMove_token) ~= 0 and getStorage(running_token) > 0 then
		doSendAnimatedText(config_tic[getStorage(turn_tocken)].token_pos,"Play",TEXTCOLOR_GREEN)
		addEvent(turn,1000)
	end
end
function checkCircle() --By Doggynub
	local raw = 0
	local check = false
	for i = 1,#Phases_Tic_Tac do 
		local caller = Phases_Tic_Tac[i]
		local item = getTileItemById(caller[1],6557).uid
		local item1 = getTileItemById(caller[2],6557).uid
		local item2 = getTileItemById(caller[3],6557).uid
 
		if ( item > 0 and item1 > 0 and item2 > 0 ) then
			check = true
			raw = i
			break
		end
	end
 
	if check == true and raw > 0 then
		local call = Phases_Tic_Tac[raw]
		for i = 1,7 do 
			addEvent(markWinningRaw, i *800, 6557,call[1] , call[2], call[3], 400)
		end
	end
 
	return check
end
 
function checkCross()--By Doggynub
	local raw = 0
	local check = false
	for i = 1,#Phases_Tic_Tac do 
		local caller = Phases_Tic_Tac[i]
		local item = getTileItemById(caller[1],6556).uid
		local item1 = getTileItemById(caller[2],6556).uid
		local item2 = getTileItemById(caller[3],6556).uid
 
		if ( item > 0 and item1 > 0 and item2 > 0 ) then
			check = true
			raw = i
			break
		end
	end
 
	if check == true and raw > 0 then
		local call = Phases_Tic_Tac[raw]
		for i = 1,7 do 
			addEvent(markWinningRaw, i *800, 6556,call[1] , call[2], call[3], 400)
		end
	end
 
	return check
end	
 
 
 
 
function isCircle(cid)--By Doggynub
	return getPlayerStorageValue(cid,config_tic[2].storage) == 1 and true or false
end
 
function isCross(cid)--By Doggynub
	return getPlayerStorageValue(cid,config_tic[1].storage) == 1 and true or false
end
 
function gatherTokens(frompos,topos, crosspos , circlepos)--By Doggynub
		for i = frompos.x, topos.x do 
			for j = frompos.y, topos.y do 
				local pos = {x = i, y=j,z=frompos.z}
				local circle = getTileItemById(pos,6557).uid
				local cross = getTileItemById(pos,6556).uid
				if cross > 0 then
					doTeleportThing(cross,crosspos)
				elseif circle > 0 then
					doTeleportThing(circle,circlepos)
				end
			end
		end
	return true
end
 
function endPoint(frompos,topos)--By Doggynub
		local check = true
		for i = frompos.x, topos.x do 
			for j = frompos.y, topos.y do 
				local pos = {x = i, y=j,z=frompos.z}
				local circle = getTileItemById(pos,6557).uid
				local cross = getTileItemById(pos,6556).uid
				if circle < 1 and cross < 1 then
					check = false
					break
				end
			end
		end
	return check
end
 
function isWinner(cid)--By Doggynub
	if isCircle(cid) then
		if checkCircle() then
			return true
		end
	elseif isCross(cid) then
		if checkCross() then
			return true
		end
	end
	return false
end
 
 
function send(uid,cid,n,type)--By Doggynub
 
		for i = 1, n do 
			if type == nil then
				addEvent(doSendDistanceShoot,i*300,getThingPos(uid),getThingPos(cid),41)
				addEvent(doSendAnimatedText,i*300,getThingPos(cid),"Winner!",math.random(0,255))
			else
				addEvent(doSendDistanceShoot,i*300,getThingPos(uid),config_tic[1].pos_game,41)
				addEvent(doSendDistanceShoot,i*300,getThingPos(uid),config_tic[2].pos_game,41)
				addEvent(doSendAnimatedText,i*300,config_tic[1].pos_game,"Draw!",math.random(0,255))
				addEvent(doSendAnimatedText,i*300,config_tic[2].pos_game,"Draw!",math.random(0,255))
			end
		end
	return true
end
function endGame()--By Doggynub
	local array = {getTopCreature(config_tic[1].pos_game).uid, getTopCreature(config_tic[2].pos_game).uid}
	local item = ITem_WinnEr[math.random(1,#ITem_WinnEr)]
	addEvent(doPlayerAddItem,1000,getStorage(winner_token),item[1],item[2])
	addEvent(doPlayerSendTextMessage,1000,getStorage(winner_token),MESSAGE_EVENT_ORANGE,"You won "..item[2] .."x ".. getItemNameById(item[1])..". If you didn't recieve it, then you don't have enogh space or cap.")
	for i = 1,2 do 
		doTeleportThing(array[i],getTownTemplePosition(getPlayerTown(array[i])))
		doCreatureSetNoMove(array[i],0)
		doRemoveCondition(array[i],CONDITION_INFIGHT)
		doSendMagicEffect(getThingPos(array[i]),10)
	end
	doSetStorage(winner_token,-1)
	doSetStorage(round_token,-1)
	doSetStorage(running_token,-1)
	doSetStorage(won_token,-1)
	return true
end
 
function doAddCopiedContainer(it, new) --By Doggynub
 
	local uid,its,news = it.uid, {},{}
	local size = getContainerSize(uid)
	local test = {}
	for i = 0, size-1 do 
		local item = getContainerItem(uid,i)
		table.insert(test,{item, item.type})
		if isContainer(item.uid) then
			table.insert(its,item)
		end
	end
 
	for i = #test,1,-1 do
		local call = test[i]
		local ufg = doAddContainerItem(new,call[1].itemid,(call[2] < 1 and 1 or call[2]) )
		if isContainer(ufg) then
			table.insert(news,ufg)
		end
	end
	for i = 1,#its do
		doAddCopiedContainer(its[i], news[i])
	end
	return true
end	
 
function getRefree(cid,type)--By Doggynub
	local str1 = ""
	local str2 = ""
	if type == nil then
		if getStorage(round_token) < 1 then
			str1 = getCreatureName(cid).." won Round <1> "
			str2 = "Round <2> : start"
			doSetStorage(round_token,2)
			doSetStorage(winner_token,cid)
		elseif getStorage(round_token) == 2 then
			if getStorage(winner_token) == cid then
				str1 = getCreatureName(cid).." won the game, and will recive his reward."
				doSetStorage(won_token,1)
				str2 = "You will be teleported out shortly."
			else
				str1 = getCreatureName(cid).." won Round <2>."
				str2 = "Final Round : start"
				doSetStorage(round_token,3)
				doSetStorage(winner_token,cid)
			end
		elseif getStorage(round_token) == 3 then
			str1 = getCreatureName(cid).." won the game, and will recive his reward."
			doSetStorage(won_token,1)
			str2 = "You will be teleported out shortly."
			doSetStorage(winner_token,cid)
		end
	else
		str1 = "No one won. Round re-match. "
		str2 = "Round <".. ( getStorage(round_token) < 1 and "1" or getStorage(round_token) ) .."> : start"
	end
	local uid = doCreateMonster("chicken",{x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z,stackpos = 0 })
	doChangeSpeed(uid, - getCreatureSpeed(uid) )
	addEvent(doCreatureSay,100,uid,str1,19)
	addEvent(doCreatureSay,10*300+ 1000,uid,str2,19)
	addEvent(turn,10*300+ 3305)
	if type == nil then
		addEvent(doCreatureSetLookDirection,10*300+ 8,uid, 2)
	end
	addEvent(doRemoveCreature,10*300+ 3300,uid)
	doCreatureSetLookDirection(uid, getDirectionTo(getThingPos(uid), getThingPos(cid)))
	send(uid,cid,10,type)
	addEvent(doSetStorage,10*300+ 3300,canMove_token,1)
		if getStorage(won_token) > 0 then
			addEvent(endGame,10*300+ 3300)
		end
 
	return true
end