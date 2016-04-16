-- Bullet
Bullet = {}

function Bullet:new(x, y, w, h, speed, direction)
  local bullet = {}

  bullet.x = x
  bullet.y = y
  bullet.w = w
  bullet.h = h
  bullet.speed = speed
  bullet.direction = direction

  -- Update Bullet buffer in love.update(dt)
  function bullet:update(dt)
    bullet:move(dt)
  end

  -- Draw Player to screen in love.draw(dt)
  function bullet:draw(dt)
    love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.w, bullet.h)
  end

  -- Move bullet after being fired
  function bullet:move(dt)
    if bullet.direction == "right" then
      bullet.x = bullet.x + (bullet.speed * dt)
    elseif bullet.direction == "left" then
      bullet.x = bullet.x - (bullet.speed * dt)
    elseif bullet.direction == "up" then
      bullet.y = bullet.y - (bullet.speed * dt)
    elseif bullet.direction == "down" then
      bullet.y = bullet.y + (bullet.speed * dt)
    end
  end

  function bullet:offScreen()
    if bullet.x <= 0 - bullet.w or bullet.x >= love.graphics.getWidth() then
      return true
    elseif bullet.y <= 0 - bullet.h or bullet.y >= love.graphics.getHeight() then
      return true
    else
      return false
    end
  end

  return bullet
end
