------ DDoS protection
------ By Mock
------ Require O.T.A.L
------ [url]http://otal.awardspace.info/[/url]
local conf = {
      check_website1 = 'http://www.google.com/', ---- First website
      check_website2 = 'http://pt.wikipedia.org/', ---- Second website
      ifoff = { --- If this 2 websites was offline
            kickall = true, --- Kick all players?
            save = true, --- Save server?
            closeserver = true, --- Exit server?
      }
}
--[[
This script every X seconds will check if google is online,
if google is off it will check wikipedia, if wikipedia is
off too is because your net is verry overloaded (DDoS attack)
or your connection is down. If all this is off this script
will kick all players, save server and close server.
]]
function onThink(interval, lastExecution)
    local re,info,kind = pcall(socket.http.request,conf.check_website1)
    if not info or re == false then
       print('::Google is off?a')
       if conf.check_website2 and conf.check_website2 ~= '' and conf.check_website2:len() > 6 then
          local re,info,kind = pcall(socket.http.request,conf.check_website2)
          if not info or re == false then
             print('::We are under attack or you connection is offline!aa')
             if conf.ifoff.kickall == true then
                for i,b in pairs(getOnlinePlayers()) do
                    doRemoveCreature(b)
                end
             end
             if conf.ifoff.save == true then
             saveServer()
             end
             if conf.ifoff.closeserver == true then
             os.sleep(2)
             os.exit()
             end
          end
       end
    end
        return TRUE
end