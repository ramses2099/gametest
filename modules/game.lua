--==========================================
-- Game module
--==========================================
local Player = require("modules.player")


local Game = {}
Game.__index = Game

function Game.newGame()
    local self = setmetatable({}, Game)
    -- init physics love 2d --
    self.PIXEL_PER_METER = 64
    love.physics.setMeter(self.PIXEL_PER_METER)
    -- self.world = love.physics.newWorld(0,9.81*self.PIXEL_PER_METER)
    self.world = love.physics.newWorld(0,0)

    -- player --
    self.player = Player.newPlayer(self)

    return self
end

function Game:update(dt)
    -- physics --
    self.world:update(dt)
    -- update player --
    self.player:update(dt)
end

function Game:draw()
    -- draw player --
    self.player:draw()
end

function Game:keypressed(key)
    self.player:keyinput(key)
end

return Game