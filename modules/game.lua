local SceneManager = require("modules.scenemanager")

local GameScene = {}
function GameScene:enter(previous, level)
    self.level = level or 1
    print("Entered Game Scene, Level: " .. self.level)
end

function GameScene:update(dt)
    -- Game logic here
end

function GameScene:draw()
    love.graphics.setColor(0.8, 0.2, 0.3, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("GAME SCENE", 0, W_HEIGHT/2, W_WIDTH, "center")
    love.graphics.printf("Press M for Menu, P for Pause", 0, W_HEIGHT/2 + 30, W_WIDTH, "center")
end

function GameScene:keypressed(key)
    local sm = SceneManager.getInstance()
    if key == "m" then
        sm:switchTo("menu", "fadeWhite", 0.3)
    elseif key == "p" then
       -- sm:push("pause", "fadeIn", 0.2)
        sm:switchTo("pause", "fadeIn", 0.2)
    end
end

return GameScene