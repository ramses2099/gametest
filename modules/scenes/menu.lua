local ScenesManager = require("modules.scenes.scenemanager")
local Game = require("modules.scenes.game")

local Menu = {}

function Menu:load()
    self.title = "My Awesome Game"    
end

function Menu:update(dt)
    
end

function Menu:draw()
    love.graphics.printf(self.title, 0, 200, love.graphics.getWidth(), "center")
    love.graphics.printf("Press ENTER to start", 0, 300, love.graphics.getWidth(), "center")    
end

function Menu:keypressed(key)
    if key == "return" then
        ScenesManager:switch(Game)
    end    
end

return Menu