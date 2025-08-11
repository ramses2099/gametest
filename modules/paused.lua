local SceneManager = require("modules.scenemanager")

local PauseScene = {}
function PauseScene:enter(previous)
    print("Game Paused")
end

function PauseScene:draw()
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("PAUSED", 0, W_HEIGHT/2, W_WIDTH, "center")
    love.graphics.printf("Press P to resume", 0, W_HEIGHT/2 + 30, W_WIDTH, "center")
end

function PauseScene:keypressed(key)
    local sm = SceneManager.getInstance()
    if key == "p" then
        -- sm:pop("fadeOut", 0.2)
        sm:switchTo("game", "fadeOut", 0.2)
    end
end

return PauseScene