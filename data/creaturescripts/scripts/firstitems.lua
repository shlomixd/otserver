-- ver. 2.3 2012-01-06
-- author tfs, otland.net/members/andypsylon
-- with a welcome letter
local c = {
	freeDays = nil, -- paste nr, for ex. 3 if you will 3 free premium days for players
	addLevel = nil, -- paste nr, for ex. 7 if you will 8 start level for players
-- letter
	text = "Hi ".. getCreatureName(cid) .." And welcome to ParadiseOT, Here is your start GEAR! ", 
	writer = "Admin Amir, (ParadiseOT)", 
	date = os.time()
--/letter
}
local commonItems = { -- items for all vocs
	{2120}, -- rope
	{2554}, -- shovel
	{2160, 100}, -- CC
	{2273}, -- uh
	{2276}, -- mr
}
local firstItems = {
	{ -- items for sorcerer
		{2323}, -- hat of the mad
		{8871}, -- focus cape
		{7730}, -- blue legs
		{2195}, -- boots of haste
		{8902}, -- spellbook of mind control
		{2187}, -- wand of inferno  
		{2268}, -- sd
		{2293} -- mw
	},
	{ -- items for druid
		{2323}, -- hat of the mad
		{8871}, -- focus cape
		{7730}, -- blue legs
		{2195}, -- boots of haste
		{8902}, -- spellbook of mind control
		{2183}, -- hailstorm rod  
		{2268}, -- sd
		{2293}, -- mw
	},
	{ -- items for palladin
		{2493}, -- demon helmet
		{8891}, -- paladin armor
		{7730}, -- blue legs
		{2195}, -- boots of haste
		{2514}, -- mastermind shield
		{7368, 10}, -- assassin stars
		{2268}, -- sd
		{2293} -- mw
	},
	{ -- items for knight
		{2493}, -- demon helmet
		{2472}, -- magic plate armor
		{2470}, -- golden legs
		{2195}, -- boots of haste
		{2514}, -- mastermind shield
		{2400}, -- magic sword
		{2313}, -- explosion
		{2293} -- mw
	}
}
 
for _, fitems in ipairs(firstItems) do
	for _, citems in ipairs(commonItems) do
		table.insert(fitems, citems)
	end
end
 
function onLogin(cid)
	if getPlayerGroupId(cid) < 2 then
		local hasReceivedFirstItems = getCreatureStorage(cid, 30001) -- 30001 - is standard storage in tfs ots, you can change for another one
 
		if hasReceivedFirstItems == -1 then
			local bp = doPlayerAddItem(cid, 2000, 1)
			local giveItems = firstItems[getPlayerVocation(cid)]
 
			if giveItems ~= nil then
				for _, v in ipairs(giveItems) do
					doAddContainerItem(bp, v[1], v[2] or 1)
				end
			end
			-- letter
			local item = doCreateItemEx(2598, 1)
			doSetItemText(item, c.text, c.writer, c.date) 
			doPlayerAddItemEx(cid, item, true)
			doShowTextDialog(cid, 2598, c.text)
			--/letter
			if c.freeDays ~= nil then
				doPlayerAddPremiumDays(cid, c.freeDays) -- how many free premium days? 3?
			end
			if c.addLevel ~= nil then
				doPlayerAddLevel(cid, c.addLevel) -- Level 8
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have recieved your first equipment")
			doCreatureSetStorage(cid, 30001, 1)  
		end
	end
	return true
end