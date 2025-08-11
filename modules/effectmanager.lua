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



return EffectManager