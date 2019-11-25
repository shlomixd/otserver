function onAttack(cid, target)
local dif = 20 -- lvl of difference
local lvlc = getPlayerLevel(cid)
local lvlt = getPlayerLevel(target)
 
if lvlc + dif >= lvlt and lvlc - dif <= lvlt then
return true
else
return false
end
end