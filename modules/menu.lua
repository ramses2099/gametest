-- Usage Example and Demo Scenes
local SceneManager = require("modules.scenemanager")

local MenuScene = {}
function MenuScene:enter(previous)
    print("Entered Menu Scene")
end

function MenuScene:update(dt)
    -- Menu logic here
end

function MenuScene:draw()
    love.graphics.setColor(0.2, 0.3, 0.8, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("2D Game Programming Example", 0, W_HEIGHT/2 - 60, W_WIDTH, "center")
    love.graphics.printf("Press SPACE to start", 0, W_HEIGHT/2 - 20, W_WIDTH, "center")
    love.graphics.printf("Arrow keys or WASD to move, SPACE to jump", 0, W_HEIGHT/2 + 20, W_WIDTH, "center")

end

function MenuScene:keypressed(key)
    local sm = SceneManager.getInstance()
    if key == "space" then
        sm:switchTo("game", "fade", 0.5)
    elseif key == "escape" then
        love.event.quit()
    end
end

return MenuScene