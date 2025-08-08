--==========================================
-- Game module
--==========================================
local Player = require("modules.player")
local Projectile = require("modules.projectile")
local Utils = require("utils.helper")
local AssetsManager = require("modules.assets")

local Game = {}
Game.__index = Game

function Game.newGame()
    local self = setmetatable({}, Game)
    -- init physics love 2d --
    self.PIXEL_PER_METER = 64
    love.physics.setMeter(self.PIXEL_PER_METER)
    -- self.world = love.physics.newWorld(0,9.81*self.PIXEL_PER_METER)
    self.world = love.physics.newWorld(0,0)

    -- Assets Manager --
    self.assetsmanager = AssetsManager.assetsManager()

     -- Projectil Pool --
    self.projectilesPool = {}
    self.numberOfProjectiles = 10

    -- player --
    self.player = Player.newPlayer(self)

    -- create projectiles Pool --
    self:createProjectiles()

    return self
end

function Game:createProjectiles()
    for i = 1, self.numberOfProjectiles, 1 do
        self.projectilesPool[i] = Projectile.newProjectile(self.world, 0, 0)
    end
end

function Game:getProjectile()
    for i=1, #self.projectilesPool, 1 do
        if self.projectilesPool[i].free then
            return self.projectilesPool[i]
        end
    end
end

function Game:update(dt)
    -- physics --
    self.world:update(dt)
    -- update player --
    self.player:update(dt)

    --#region PROJECTILE
    for i = 1, #self.projectilesPool, 1 do
        self.projectilesPool[i]:update(dt)        
    end
    --#endregion
end

function Game:draw()
    -- draw background --
    love.graphics.draw(self.assetsmanager.images["background"],0,0)

    -- draw player --
    self.player:draw()

    --#region PROJECTILE
    for i = 1, #self.projectilesPool, 1 do
        self.projectilesPool[i]:draw()        
    end
    --#endregion
end

function Game:keypressed(key)
    self.player:keyinput(key)
end

return Game