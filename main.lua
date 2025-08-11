_G.love = require("love")
local sceneManager = require("modules.scenemanager")
local MenuScene = require("modules.menu")
local PausedScene = require("modules.paused")
local GameScene = require("modules.game")

_G.W_WIDTH = 600
_G.W_HEIGHT = 800
_G.DEBUG = true

local function initSceneManager()
  local sm = sceneManager.getInstance()

  -- registry
  sm:registerScene("menu", MenuScene)
  sm:registerScene("game", GameScene)
  sm:registerScene("pause", PausedScene)

  sm:switchTo("menu")

  return sm
end

local sm

function love.load()
  -- Load assets, initialize game state --
  sm = initSceneManager()
end

function love.update(dt)
  -- Update game logic
  -- game -- 
  sm:update(dt)
end

function love.draw()
  -- draw --
  sm:draw()

  -- Display FPS
  if DEBUG then    
    --local r, g, b = table.unpack(Colors["white"][0])
    love.graphics.setColor(1,1,1,1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end

end

function love.keypressed(key, scancode, isrepeat)
  -- key pressed process --
  sm:keypressed(key, scancode, isrepeat)
  -- close --
  if key == "escape" then
    love.event.quit()
  end
end
