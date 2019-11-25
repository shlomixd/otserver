dofile('./data/Phases.lua') --<< line 1 script started
 
local fight = createConditionObject(CONDITION_INFIGHT,-1)
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pl1_game = getTopCreature(config_tic[1].pos_start).uid
	local pl2_game = getTopCreature(config_tic[2].pos_start).uid
	local players1_enter = getTopCreature(config_tic[1].pos_game).uid
	local players2_enter = getTopCreature(config_tic[2].pos_game).uid
	local players = {}
 
	if  players1_enter < 1 and players2_enter < 1 then
		if getStorage(running_token) > 0 then
			doSetStorage(winner_token,-1)
			doSetStorage(round_token,-1)
			doSetStorage(running_token,-1)
			doSetStorage(won_token,-1)
		end
	end
 
	if getStorage(running_token) > 0 then
		return  doPlayerSendCancel(cid,"The players inside didn't finish there game yet.")
	end
 
	if pl1_game > 0 and pl2_game > 0 then
		table.insert(players, pl1_game)
		table.insert(players, pl2_game)
	else
		return doPlayerSendCancel(cid,"The game needs 2 players to start.")
	end
	gatherTokens(tic_pos.frompos,tic_pos.topos, config_tic[1].token_pos , config_tic[2].token_pos)
	for i = 1,#players do 
		doTeleportThing(players[i],config_tic[i].pos_game,false)
		doSendMagicEffect(config_tic[i].pos_game,10)
		doCreatureSetNoMove(players[i],1)
		doAddCondition(players[i],fight)
		setPlayerStorageValue(players[i],config_tic[i].storage,1)
		setPlayerStorageValue(players[i],turn_id_tocken,i)
	end
	local uid = doCreateMonster("chicken",{x = tic_pos.frompos.x+1, y = tic_pos.frompos.y+1, z = tic_pos.frompos.z,stackpos = 0 })
 
	doSetStorage(turn_tocken,math.random(1,2))
	doSetStorage(running_token,1)
	doChangeSpeed(uid, - getCreatureSpeed(uid) )
	doSetStorage(canMove_token,0)
	addEvent(doCreatureSay,100,uid,"Round <1> : start",19)
	addEvent(doRemoveCreature,2400,uid)
	addEvent(doSetStorage,2410,canMove_token,1)
	addEvent(turn,2411)
 
 
	return true
end