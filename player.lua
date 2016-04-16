Player = {}

function Player:new(x, y, speed)
	local player = {}

	player.x = x
	player.y = y
	player.speed = speed

	function player:move(dt)
		if love.keyboard.isDown("left") then
			player.x = player.x - player.speed * dt
		elseif love.keyboard.isDown("right") then
			player.x = player.x + player.speed * dt
		end
	end

	return player
end
