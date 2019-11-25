function getOnlineGuildMembers(cid) -- by Xafterin
		local t = {}
		local p = getPlayersOnline()
		local g = getPlayerGuildId(cid)
		for _, ps in ipairs(p) do
			local gs = getPlayerGuildId(ps)
			if(g == gs and gs > 0 and g > 0) then
				table.insert(t, ps)
			end
		end
		return t
	end
	function getGuildMembersByVoc(cid, voc) -- by Xafterin
		local h = getOnlineGuildMembers(cid)
		for _, gid in ipairs(h) do
			local vg = getPlayerVocation(gid)
			if(vg == voc) then
				local gv = {}
				table.insert(gv, gid)
				return gv
			end
		end
		return false
	end
	function getPartyMembersByVoc(cid, voc) -- by Xafterin
		local h = getPartyMembers(cid)
		for _, yid in ipairs(h) do
			local vx = getPlayerVocation(yid)
			if(vx == voc) then
				local yv = {}
				table.insert(yv, yid)
				return yv
			end
		end
		return false
	end
	local text = ""
	local vocCount = {}
function onSay(cid, words, param, channel)-- Made by Xafterin / KylerXX (from Otserv.es)
	if(words == "!partycheck") then
		local pmem = getPartyMembers(getPartyLeader(cid))
		text = "-- Party Check --\n"
		if(type(pmem) == "table") then
			if(#pmem == 1) then
				text = text .. "You are alone!!!"
				return doPlayerSendTextMessage(cid, 22, text)
			else
				for _, pyd in ipairs(pmem) do
					local v = getPlayerVocation(pyd)
					local getp = getPlayerParty(pyd)
					for i = 0, 4 do
						local regv = {}
						regv[i] = 0
						if(v == i) then
							regv[v] = regv[v]+1
							local vocvar = getVocationInfo(i).name
							text = text .. " " .. regv[v] .. " " .. vocvar .. "\n"
						end
					end
				end
				local k = getPartyMembersByVoc(cid, 4)
 
				if (k) then
					text = text .. "\n  --High knights: "
					for _, kid in ipairs(k) do
						local count = 0
						local klvl = getPlayerLevel(kid)
						if(klvl > 0) then
							count = count + 1
							if(count <= 3) then
								text = text .. getPlayerName(kid) .. "[".. klvl .."]" .. (count < 3 and ", " or ".")
							end
						end
					end
					text = text .. "."
				end
			end                                          
		else
			text = "-- You are not in any party. -- "
		end
	elseif(words == "!guildcheck") then
		local gmem = getOnlineGuildMembers(cid)
		text = "-- Guild Check --\n"
		if(#gmem ~= 0) then
			local noneCount = 0
			local g = {name = getPlayerGuildName(cid)}
			text = "[".. g.name .."] There are ".. #gmem .." players playing. "
			for _, gid in ipairs(gmem) do
				noneCount = noneCount + 1
				text = text .. getPlayerName(gid) .. (noneCount == #gmem and "." or ", ") 
			end
			local k = getGuildMembersByVoc(cid, 4)
 
			if (k ) then
				text = text .. "\n  --High knights: "
 
				for _, kid in ipairs(k) do
					local count = 0
					local klvl = getPlayerLevel(kid)
					if(klvl > 0) then
						count = count + 1
						if(count <= 3) then
							text = text .. getPlayerName(kid) .. "[".. klvl .."]" .. (count < 3 and ", " or ".")
						end
					end
				end
 
				text = text .. "."
			end
		else
			text = "You are not in a guild."
		end
	end
 
	return doPlayerSendTextMessage(cid, 22, text)
end