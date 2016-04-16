-- Player
Player = {}

-- Generate new Player
function Player:new(x, y, speed)
	local player = {}

	player.x = x
	player.y = y
	player.speed = speed

	player.bullets = {}
	player.shootWaitTime = 0

	-- Update Player buffer in love.update(dt)
	function player:update(dt)
		player:move(dt)
		player:shoot(dt)
	end

	-- Draw Player to screen in love.draw(dt)
	function player:draw(dt)
		love.graphics.setColor(255, 0, 0)
		love.graphics.rectangle("fill", player.x, player.y, 25, 25)

		-- Draw fired bullets to the screen
		love.graphics.setColor(0, 255, 0)
		for i, b in pairs(player.bullets) do
			love.graphics.rectangle("fill", b.x, b.y, 10, 10)
		end
	end

	-- Check for user input to control Player
	function player:move(dt)
		if love.keyboard.isDown("left") then
			if player.x > 0 then
				player.x = player.x - player.speed * dt
			end
		elseif love.keyboard.isDown("right") then
			if player.x < (love.graphics.getWidth() - 25) then
				player.x = player.x + player.speed * dt
			end
		end

		if love.keyboard.isDown("up") then
			if player.y > 0 then
				player.y = player.y - player.speed * dt
			end
		elseif love.keyboard.isDown("down") then
			if player.y < (love.graphics.getHeight() - 25) then
				player.y = player.y + player.speed * dt
			end
		end
	end

	-- Fire bullets
	function player:shoot(dt)
		player.shootWaitTime = player.shootWaitTime - (1 * dt)

		for i, b in pairs(player.bullets) do
			b:update(dt)

			if b:offScreen() then
				table.remove(player.bullets, i)
			end
		end

		-- Check Player input to fire bullets
		if love.keyboard.isDown("d") then
			table.insert(player.bullets, Bullet:new(player.x, player.y, 15, 15, 300, "right"))
		elseif love.keyboard.isDown("a") then
			table.insert(player.bullets, Bullet:new(player.x, player.y, 15, 15, 300, "left"))
		elseif love.keyboard.isDown("w") then
			table.insert(player.bullets, Bullet:new(player.x, player.y, 15, 15, 300, "up"))
		elseif love.keyboard.isDown("s") then
			table.insert(player.bullets, Bullet:new(player.x, player.y, 15, 15, 300, "down"))
		end

		player.shootWaitTime = 0.2
	end

	return player
end
