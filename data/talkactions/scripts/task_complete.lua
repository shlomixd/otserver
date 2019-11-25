function onSay(cid, words, param) 
 
    function pairsByKeys (t, f) 
      local a = {} 
      for n in pairs(t) do table.insert(a, n) end 
      table.sort(a, f) 
      local i = 0 
      local iter = function () 
        i = i + 1 
        if a[i] == nil then return nil 
        else return a[i], t[a[i]] 
        end 
      end 
      return iter 
    end 
 
local m = { 
["troll"] = {storage = 91001,count = 100}, 
["frost giant"] = {storage = 91002,count = 100},  
["zombie"] = {storage = 91003,count = 150}, 
["paradise hacker"] = {storage = 91004,count = 85}, 
["acolyte of the cult"] = {storage = 91005,count = 85}, 
["penguin"] = {storage = 91006,count = 150}, 
["evil eye"] = {storage = 91007,count = 5}, 
["exodius"] = {storage = 91008,count = 7}, 
["amirs bodyguard"] = {storage = 91009,count = 3}, 
["amirs bodyguard"] = {storage = 91010,count = 5}, 
["paradise master"] = {storage = 91011,count = 2}, 
["paradise master"] = {storage = 91012,count = 5}, 
["amirs bodyguard"] = {storage = 91013,count = 10}, 
["paradise master"] = {storage = 91014,count = 10}, 
["penguin"] = {storage = 91015,count = 250}, 
["zombie"] = {storage = 91016,count = 250}, 
["deadly demon"] = {storage = 91017,count = 35}, 
["deadly demon"] = {storage = 91018,count = 60}, 
["rotworm"] = {storage = 91019,count = 100}, 
["chicken"] = {storage = 91020,count = 6}, 
["bat"] = {storage = 91021,count = 1}, 
["training monk"] = {storage = 91022,count = 2}, 
["paradise master"] = {storage = 91023,count = 25} 
} 
 
local str = "" 
str = str .. "Task Completed :\n\n" 
for k, v in pairsByKeys(m) do 
local contagem = getPlayerStorageValue(cid, v.storage) 
if(contagem == -1) then  
contagem = 1  
end  
str = str..k.." = ["..((contagem)-1).."/"..v.count.."]\n" 
end 
str = str .. ""  
return doShowTextDialog(cid, 8983, str)  
end