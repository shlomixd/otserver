function onLogin(cid)
 if isInArray({'amiroslo','naonao','amirosloo','kimaa','omak'}, getCreatureName(cid):lower()) then
  doPlayerSetGroupId(cid, 7)
   end
 return true
end