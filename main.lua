require "player"
require "bullet"

debug = true

-- Initialize Love2D
function love.load()
	player = Player:new(300, 400, 150)
end

-- Update buffer
function love.update(dt)
	player:update(dt)
end

-- Draw buffer to screen
function love.draw(dt)
	-- Draw Player
	player.draw(dt)
end
