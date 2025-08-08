local HealthBar = {}
HealthBar.__index = HealthBar

function HealthBar.newHealthBar(x, y)
    local self = setmetatable({}, HealthBar)
    self.x = x
    self.y = y
    self.current = 90 -- 100
    self.max = 100
    self.isAlive = true
    self.dot = {
        active = false,
        damagePerSecond = 5,
        timer = 0
    }

    return self
end

function HealthBar:takeDamage(amount)
    if self.isAlive then
        self.current = self.current - amount
        if self.current < 0 then
            self.current = 0
        end
    end
end

function HealthBar:update( dt )
       -- Apply damage over time if active
    if self.dot.active then
        self.dot.timer = self.dot.timer + dt
        if self.dot.timer >= 1 then
            -- takeDamage(health, health.dot.damagePerSecond)
            self.dot.timer = 0
        end
    end
    
    -- Check if the player is dead
    if self.current <= 0 and self.isAlive then
        self.isAlive = false
        print("Player has died!")
        -- You would typically add game over logic here
    end
end

function HealthBar:draw()
    -- Background bar (empty health)
    love.graphics.setColor(0.5, 0.5, 0.5) -- Gray
    love.graphics.rectangle("fill", self.x, self.y, 200, 20)
    
    -- Foreground bar (current health)
    local healthPercentage = self.current / self.max
    local healthBarWidth = 200 * healthPercentage
    love.graphics.setColor(0, 1, 0) -- Green
    love.graphics.rectangle("fill", self.x, self.y, healthBarWidth, 20)
    
    -- Border
    love.graphics.setColor(1, 1, 1) -- White
    love.graphics.rectangle("line", self.x, self.y, 200, 20)

end


return HealthBar