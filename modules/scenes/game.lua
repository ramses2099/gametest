local ScenesManager = require("modules.scenes.scenemanager")

local Game = {}

function Game:load()
    self.title = "My Game Scene"    
end

function Game:update(dt)
    
end

function Game:draw()
    love.graphics.printf(self.title, 0, 200, love.graphics.getWidth(), "center")
    love.graphics.printf("Press m to back menu", 0, 300, love.graphics.getWidth(), "center")    
end

function Game:keypressed(key)
    if key == "m" then
        ScenesManager:switch(ScenesManager.prev)
    end    
end

return Game