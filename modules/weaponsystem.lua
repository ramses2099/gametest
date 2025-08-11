local WeaponType = require("modules.weapontype")
local Weapon = require("modules.weapon")

local WeaponSystem = {}
WeaponSystem.__index = WeaponSystem

function WeaponSystem.new()
    local self = setmetatable({}, WeaponSystem)
    self.definitions = {}  
    self.weapon = {}

    return self
end

function WeaponSystem:init()
    self.definitions["pistol"] = WeaponType.new("Pistol", 25, 0.3, 600, "bullet", 0, 12, 12, 1.5, 0.05, 5, false,0)
    self.definitions["shotgun"] = WeaponType.new("Shotgun", 15, 0.8, 400, "pellet", 6, 8, 8, 2.0, 0.3, 15,false,0)
    self.definitions["machinegun"] = WeaponType.new("Machine Gun", 12, 0.08, 550, "bullet",0, 60, 60, 3.0, 0.1, 3, false,0)
    self.definitions["railgun"] = WeaponType.new("Railgun", 100, 2.0, 1000, "rail",0, 5, 5, 2.5, 0, 25, true,0)
    self.definitions["rocket"] = WeaponType.new("Rocket Launcher", 80, 1.5, 300,"rocket",0, 4, 4, 3.5, 0.02, 20, false, 60)   
end

function WeaponSystem:createWeapon(type)
  
end




return WeaponSystem