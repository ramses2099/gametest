local Enemy = {}
Enemy.__index = Enemy

function Enemy.newEnemy(world, x, y, width, height, bodyType, density)
    local self = setmetatable({}, Enemy)
    self.tag = "Enemy"
    self.width = width or 32
    self.height = height or 32
    self.bodyType = bodyType or "dynamic"
    self.density = density or 1
    self.body = love.physics.newBody(world, x, y, self.bodyType)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, self.density)

    return self    
end

function Enemy:update( dt )
    
end

function Enemy:draw()
   
end