         local text = {
        [1] = "Server website: http://paradiseot.hopto.org",
	[2] = "Welcome to ParadiseOT: Use !commands to check the commands",
        }
function onThink(interval, lastExecution)
doBroadcastMessage("Paradise Auto Broadcast: "..text[math.random(1,2)])
        return TRUE
end
