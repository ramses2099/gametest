local Player = {}
Player.__index = Player

function Player.newPlayer(game)
    local self = setmetatable({}, Player)
    self.tag = "Player"
    self.game = game
    self.width = 64
    self.height = 64
    self.x = (W_WIDTH * 0.5 - 64/2)
    self.y = W_HEIGHT- 64
    self.bodyType = "dynamic"
    self.density = 1
    self.body = love.physics.newBody(self.game.world, self.x, self.y, self.bodyType)
    self.shape = love.physics.newRectangleShape(self.width/2, self.height/2, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, self.density)
    self.body:setFixedRotation(true)

    return self
end

function Player:shoot()
    local projectile = self.game:getProjectile()
    
    if projectile then
        local x, y = self.body:getPosition()
        x = x + self.width * 0.5
        projectile:start(x, y)
    end
end


function Player:keyinput(key)
    if key == "right" then
        self.body:applyForce(600,0)
    elseif key == "left" then
        self.body:applyForce(-600,0)
    elseif key == "space" then     
        self:shoot()
    end
end

function Player:update( dt )
    if (self.body:getX() <= -self.width/2) then
        self.body:setPosition((-self.width/2),(W_HEIGHT- 64))
    elseif(self.body:getX() >= W_WIDTH - self.width/2) then
        self.body:setPosition((W_WIDTH -self.width/2),(W_HEIGHT- 64))
    end        
end

function Player:draw()
  love.graphics.setColor(0.28, 0.63, 0.05)
  love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end



return Player