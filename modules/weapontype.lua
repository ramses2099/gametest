local WeaponType = {}
WeaponType.__index = WeaponType

function WeaponType.newWeaponType(name, damage, fireRate, projectileSpeed,  projectileType, ammo, maxAmmo, reloadTime, spread, recoil)
    local self = setmetatable({}, WeaponType)
    self.name = name
    self.damage = damage
    self.fireRate = fireRate
    self.projectileSpeed = projectileSpeed
    self.projectileType = projectileType
    self.ammo = ammo
    self.maxAmmo = maxAmmo
    self.reloadTime = reloadTime
    self.spread = spread
    self.recoil = recoil
    return self
end

return WeaponType