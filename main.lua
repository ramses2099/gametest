_G.love = require("love")

local Scenes = require("modules.scenes")

_G.W_WIDTH = 600
_G.W_HEIGHT = 800
_G.DEBUG = true

function love.load()
  -- Load assets, initialize game state --
  scenesManager = Scenes.SceneManager
  scenesManager:switch(Scenes.Menu)
end

function love.update(dt)
  -- Update game logic
  scenesManager:update(dt)
end

function love.draw()
  -- Render everything
    scenesManager:draw()

  
   -- Display FPS
  if DEBUG then
  --   local fontdefault = game.assetsmanager.font["default"]
  --   love.graphics.setFont(fontdefault)
    love.graphics.setColor(1, 1, 1, 1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end

end

function love.keypressed(key)
  scenesManager:keypressed(key)
  
  if key == "escape" then
        love.event.quit()
  end
end
