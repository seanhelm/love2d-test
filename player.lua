-- Player
Player = {}

-- Generate new Player
function Player:new(x, y, speed)
	local player = {}

	player.x = x
	player.y = y
	player.speed = speed

	player.width = 25
	player.height = 25

	player.bullets = {}

	-- Update Player buffer in love.update(dt)
	function player:update(dt)
		player:move(dt)
		player:shoot(dt)
	end

	-- Draw Player to screen in love.draw(dt)
	function player:draw(dt)
		-- Draw fired bullets to the screen
		love.graphics.setColor(0, 255, 0)
		for i, b in pairs(player.bullets) do
			love.graphics.rectangle("fill", b.x, b.y, 10, 10)
		end

		-- Draw Player to the screen
		love.graphics.setColor(255, 0, 0)
		love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
	end

	-- Check for user input to control Player
	function player:move(dt)
		if love.keyboard.isDown("left") then
			if player.x > 0 then
				player.x = player.x - player.speed * dt
			end
		elseif love.keyboard.isDown("right") then
			if player.x < (love.graphics.getWidth() - player.width) then
				player.x = player.x + player.speed * dt
			end
		end

		if love.keyboard.isDown("up") then
			if player.y > 0 then
				player.y = player.y - player.speed * dt
			end
		elseif love.keyboard.isDown("down") then
			if player.y < (love.graphics.getHeight() - player.height) then
				player.y = player.y + player.speed * dt
			end
		end
	end

	-- Fire bullets
	function player:shoot(dt)
		for i, b in pairs(player.bullets) do
			b:update(dt)

			if b:offScreen() then
				table.remove(player.bullets, i)
			end
		end

		-- Check Player input to fire bullets
		function love.keypressed(key)
			local bulletX = player.x + (player.width / 2) - 5
			local bulletY = player.y + (player.height / 2) - 5

			if key == "d" then
				table.insert(player.bullets, Bullet:new(bulletX, bulletY, 15, 15, 300, "right"))
			elseif key == "a" then
				table.insert(player.bullets, Bullet:new(bulletX, bulletY, 15, 15, 300, "left"))
			elseif key == "w" then
				table.insert(player.bullets, Bullet:new(bulletX, bulletY, 15, 15, 300, "up"))
			elseif key == "s"  then
				table.insert(player.bullets, Bullet:new(bulletX, bulletY, 15, 15, 300, "down"))
			end
		end
	end

	return player
end
