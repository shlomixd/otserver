function onThink(interval, lastExecution)
         for _, name in ipairs(getOnlinePlayers()) do
         local cid = getPlayerByName(name)
               if getPlayerVipDays(cid) >= 1 then
                  doSendMagicEffect(getPlayerPosition(cid), 27)
                  doSendAnimatedText(getPlayerPosition(cid), "VIP!", TEXTCOLOR_RED)
               end
         end
         return true
end