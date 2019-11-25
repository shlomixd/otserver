local expMult = 2
function onLogin(cid)
if(getPlayerVipDays(cid) > 0) then
doPlayerSetExtraExpRate(cid, expMult)
end
return true
end

function onAdvance(cid, skill, oldLevel, newLevel)
if (skill == SKILL__LEVEL) then
if(getPlayerVipDays(cid) > 0) then
doPlayerSetExtraExpRate(cid, expMult)
end
end
return true
end