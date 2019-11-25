--[[ 
        Talking Tp/signs/tiles for TFS 0.3+
        by Maxi (Shawak)
]]--

        local text = {
        --X pos,Y pos, Z pos, text
		[1] = {pos = {991,905,7}, text = {"VIP"}},
              [2] = {pos = {988,901,7}, text = {"Shop"}},
              [3] = {pos = {991,898,7}, text = {"Quests"}},
              [4] = {pos = {988,900,7}, text = {"Depo"}},
              [5] = {pos = {989,898,7}, text = {"Monsters"}},
              [6] = {pos = {993,898,7}, text = {"TM"}},
              [7] = {pos = {999,905,7}, text = {"Games"}},
              [8] = {pos = {997,898,7}, text = {"Towns"}},
              [9] = {pos = {995,898,7}, text = {"Wedding"}},
              [10] = {pos = {1089,1097,7}, text = {"Bosses"}},
              [11] = {pos = {1091,1097,7}, text = {"Reborn Hunts"}},
              [12] = {pos = {1089,1150,7}, text = {"1reb+"}},	
              [13] = {pos = {1089,1152,7}, text = {"3reb+"}},		
        }

		
        local effects = {
        --X pos,Y pos, Z pos, effect
		[1] = {pos = {991,905,7}, effect = {1}},
              [2] = {pos = {988,901,7}, effect = {4}},
              [3] = {pos = {991,898,7}, effect = {5}},
              [4] = {pos = {988,900,7}, effect = {6}},
              [5] = {pos = {989,898,7}, effect = {7}},
              [6] = {pos = {993,898,7}, effect = {8}},
              [7] = {pos = {999,905,7}, effect = {9}},
              [8] = {pos = {997,898,7}, effect = {10}},
              [9] = {pos = {995,898,7}, effect = {12}},
              [10] = {pos = {1089,1097,7}, effect = {2}},
              [11] = {pos = {1091,1097,7}, effect = {3}},
              [12] = {pos = {1089,1150,7}, effect = {11}},
              [13] = {pos = {1089,1152,7}, effect = {13}},
        }

function onThink(interval, lastExecution)
        for _, area in pairs(text) do
                doSendAnimatedText({x=area.pos[1],y=area.pos[2],z=area.pos[3]},area.text[1], math.random(01,255))
        end
        for _, area in pairs(effects) do
                doSendMagicEffect({x=area.pos[1],y=area.pos[2],z=area.pos[3]},area.effect[1])
        end
        return TRUE
end 