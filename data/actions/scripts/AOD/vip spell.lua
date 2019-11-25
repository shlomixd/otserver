local spellName = "Vip spell"
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 1234 then
		if not getPlayerLearnedInstantSpell(cid, spellName) then
			doPlayerLearnInstantSpell(cid, spellName)
		else
			doPlayerSendCancel(cid, "You cannot learn this spell twice.")
		end	
	end
	return true
end