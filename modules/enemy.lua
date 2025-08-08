local Enemy = {}
Enemy.__index = Enemy

function Enemy.newEnemy(game, positionX, positionY)
    local self = setmetatable({}, Enemy)
    self.tag = "Enemy"
    self.game = game
    self.width = 64
    self.height = 64
    self.bodyType = "dynamic"
    self.density = 1
    self.body = love.physics.newBody(self.game.world, x, y, self.bodyType)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, self.density)

    return self    
end

function Enemy:update( dt )
    
end

function Enemy:draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end