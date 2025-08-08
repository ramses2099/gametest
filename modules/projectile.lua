Projectile = {}
Projectile.__index = Projectile

function Projectile.newProjectile(world, x, y)
    local self = setmetatable({}, Projectile)
    self.tag = "Projectile"
    self.free = true
    self.speed = 20
    self.width =  4
    self.height = 20
    self.bodyType = "dynamic"
    self.density =  1
    self.body = love.physics.newBody(world, x, y, self.bodyType)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, self.density)
    self.body:setFixedRotation(true)
    
    return self    
end

function Projectile:start(x, y)    
    x = x - self.width * 0.5
    self.body:setPosition(x, y)
    self.free = false
end

function Projectile:reset()
    self.free = true
end

function Projectile:update( dt )
    if self.free ~= true then
        self.body:applyForce(0, -self.speed)
        if (self.body:getY()< self.height) then
            self:reset()
        end             
    end
end

function Projectile:draw()
   if self.free ~= true then
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
   end
end

return Projectile