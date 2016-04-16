require "player"

debug = true

function love.load()
	player = Player:new(300, 200, 150)
end

function love.update(dt)
	player:move(dt)
end

function love.draw(dt)
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", player.x, player.y, 25, 25)
end
