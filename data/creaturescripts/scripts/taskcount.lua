function onKill(cid, target)  
 
local m = { 
["troll"] = 91001, 
["frost giant"] = 91002,  
["zombie"] = 91003, 
["paradise hacker"] = 91004, 
["acolyte of the cult"] = 91005, 
["penguin"] = 91006, 
["evil eye"] = 91007, 
["exodius"] = 91008, 
["amirs bodyguard"] = 91009, 
["amirs bodyguard"] = 91010, 
["paradise master"] = 91011, 
["paradise master"] = 91012, 
["amirs bodyguard"] = 91013, 
["paradise master"] = 91014, 
["penguin"] = 91015, 
["zombie"] = 91016, 
["deadly demon"] = 91017, 
["deadly demon"] = 91018, 
["rotworm"] = 91019, 
["chicken"] = 91020, 
["bat"] = 91021, 
["training monk"] = 91022, 
["amirs bodyguard"] = 91023,
["paradise master"] = 91024
}  
   
if(isMonster(target) == TRUE) then  
local n = getCreatureName(target)  
local name_monster = m[string.lower(n)]  
if(name_monster) then  
local contagem = getPlayerStorageValue(cid, name_monster)  
if(contagem == -1) then  
contagem = 1  
end  
setPlayerStorageValue(cid, name_monster, contagem+1)   
end  
end  
return TRUE  
end