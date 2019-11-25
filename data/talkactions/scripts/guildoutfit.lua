local config = {
	exhaustionInSeconds = 30,
	storage = 34534
}

function onSay(cid, words, param)
	if exhaustion.check(cid, config.storage) then
		return doPlayerSendCancel(cid, "You can change outfit only 1 time per " .. config.exhaustionInSeconds .. " seconds.")
	end

	local playerGuild = getPlayerGuildId(cid)
	if playerGuild == 0 then
		return doPlayerSendCancel(cid, "Sorry, you're not in a guild.")
	end

	local playerGuildLevel = getPlayerGuildLevel(cid)
	if(playerGuildLevel < GUILDLEVEL_LEADER) then
		return doPlayerSendCancel(cid, "You have to be Leader of your guild to change outfits!")
	end

	local players = getPlayersOnline()
	local outfit = getCreatureOutfit(cid)
	local message = "*Guild* Your outfit has been changed by leader. (" .. getCreatureName(cid) .. ")"
	local members = 0
	local tmp = {}
	for i, tid in ipairs(players) do
		if cid ~= tid and getPlayerGuildId(tid) == playerGuild then
			local tidOutfit = getCreatureOutfit(tid)
			if table.find(maleOutfits, tidOutfit.lookType) or table.find(femaleOutfits, tidOutfit.lookType) then
				tmp = outfit
				if not canPlayerWearOutfit(tid, outfit.lookType, outfit.lookAddons) then
					
					tmp.lookType = tidOutfit.lookType
					tmp.lookAddons = tidOutfit.lookAddons
				end

				doSendMagicEffect(getCreaturePosition(tid), 66)
				doCreatureChangeOutfit(tid, tmp)
				doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
				members = members + 1
			end
		end
	end

	exhaustion.set(cid, config.storage, config.exhaustionInSeconds)
	return doPlayerSendCancel(cid, "Guild members outfit has been changed. (Total: " .. members .. ")")
end