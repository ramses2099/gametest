local Enemy = require("modules.enemy")

local Wave = {}
Wave.__index = Wave

function Wave.newWave(game)
    local self = setmetatable({}, Wave)
    self.game = game
    self.width = self.game.rows * self.game.enemySize
    self.height = self.game.columns * self.game.enemySize
    self.x = 0
    self.y = 0
    self.speedX = 400
    self.speedY =0
    
    return self
end


function Wave:update( dt )
    self.speedY = 0
    if self.x < 0 or self.x > W_WIDTH - self.width then
        self.speedX = self.speedX * -1
        self.speedY = self.speedY + self.game.enemySize
    end
    self.x = self.x + self.speedX * dt
    self.y = self.y + self.speedY * dt
end

function Wave:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end


return Wave