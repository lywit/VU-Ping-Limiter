local config = require('config.lua')

function CheckPing(player)
	if(player.ping > config.maxPing) then
		print('Kicking ' .. player.name .. ' for high ping!')
		player:Kick('Automatic Kick: Your ping is too high! Ping: ' .. player.ping)
	end
end

Events:Subscribe('Player:Respawn', function(player)
		if (player ~= nil) then
			CheckPing(player)
		end

end)

Events:Subscribe('Player:Killed', function(player, inflictor, position, weapon, isRoadKill, isHeadShot, wasVictimInReviveState, info)
	if (player ~= nil) then
		CheckPing(player)
	end

	if (inflictor ~= nil) then
		CheckPing(inflictor)
	end
end)
