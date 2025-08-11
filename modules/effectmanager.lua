local EffectManager = {}
EffectManager.__index = EffectManager

function EffectManager.init()
    local self = setmetatable({}, EffectManager)
    self.effects = {}
    return self    
end

function EffectManager:addMuzzleFlash(x, y, angle)
    table.insert(self.effects,{
        type = "muzzle",
        x = x,
        y = y,
        angle = angle,
        life = 0.1,
        maxLife = 0.1
    })    
end

function EffectManager:addImpact( x, y )
    for i = 1, 5 do
        table.insert(self.effects, {
            type = "spark",
            x = x,
            y = y,
            dx = (love.math.random() - 0.5) * 100,
            dy = (love.math.random() - 0.5) * 100,
            life = 0.3,
            maxLife = 0.3
        })
    end
end

return EffectManager