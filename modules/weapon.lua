local Weapon = {}
Weapon.__index = Weapon

function Weapon.new(type)
    local self = setmetatable({}, Weapon)
    self.type = type

    local def = self.definitions[self.type]
    if not def then return nil end
    
    self.wpon = {}

    for k, v in pairs(def) do
        self.wpon[k] = v
    end

    self.cooldown = 0
    self.reloading = false
    self.reloadTime = 0

    return self
end

function Weapon:update(dt, x, y, targetX, targetY, firing)
    self.cooldown = math.max(0, self.cooldown - dt)

    if self.reloading then
        self.reloadTime = self.reloadTime - dt
        if self.wpon.reloadTime <= 0 then
            self.reloading = false
            self.wpon.ammo = self.wpon.maxAmmo
        end
        return        
    end
    
    if firing and self.cooldown <= 0 and self.wpon.ammo > 0 then
        self:fire(x, y, targetX, targetY)
    end
end

function Weapon:fire(x, y, targetX, targetY)
    local dx = targetX - x
    local dy = targetY - y
    local len = math.sqrt(dx * dx + dy * dy)
    if len == 0 then return end
    dx, dy = dx / len, dy / len

    if self.wpon.projectileType == "pellet" then
        -- Shotgun
        for i = 1, self.wpon.pelletCount, 1 do
            local spread = (love.math.random() - 0.5) * self.wpon.spread
            local angle = math.atan2(dy, dx) + spread

            -- Projectil

            
        end
    else
        -- Single
        local spread = (love.math.random() - 0.5) * self.wpon.spread
        local angle = math.atan2(dy, dx) + spread

        -- Projectil

        
    end

    -- Effect


    self.cooldown = self.wpon.fireRate
    self.wpon.ammo = self.wpon.ammo - 1
    
    if self.wpon.ammo <= 0 then
        self:reload()
    end

end

function Weapon:reload()
    if not self.reloading and self.wpon.ammo <self.wpon.maxAmmo then
       self.reloading = true
       self.reloadTime = self.wpon.reloadTime
    end
end

return Weapon