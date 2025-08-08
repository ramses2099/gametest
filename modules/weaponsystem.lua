local WeaponSystem = {}
WeaponSystem.__index = WeaponSystem

function WeaponSystem.newWeaponSystem()
    local self = setmetatable({}, WeaponSystem)

    self.definitions = {}



    return self
end






return WeaponSystem