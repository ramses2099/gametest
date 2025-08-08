_G.love = require("love")
_G.W_WIDTH = 600
_G.W_HEIGHT = 800
_G.DEBUG = true

function love.load()
  -- Load assets, initialize game state
end

function love.update(dt)
  -- Update game logic
end

function love.draw()
  -- Render everything
   -- Display FPS
  if DEBUG then
    love.graphics.setColor(1, 1, 1, 1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end

end

function love.keypressed(key)
  if key == "escape" then
        love.event.quit()
    end
end
