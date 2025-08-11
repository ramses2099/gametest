local WeaponType = {}
WeaponType.__index = WeaponType

function WeaponType.new(name, damage, fireRate, projectileSpeed, projectileType, pelletCount, ammo, maxAmmo, reloadTime, spread, recoil, penetration, explosionRadius)
    local self = setmetatable({}, WeaponType)
    self.name = name
    self.damage = damage
    self.fireRate = fireRate
    self.projectileSpeed = projectileSpeed
    self.projectileType = projectileType
    self.pelletCount = pelletCount
    self.ammo = ammo
    self.maxAmmo = maxAmmo
    self.reloadTime = reloadTime
    self.spread = spread
    self.recoil = recoil
    self.penetration = penetration
    self.explosionRadius = explosionRadius
    return self    
end

return WeaponType