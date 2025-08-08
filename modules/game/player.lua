local Player = {}
Player.__index = Player

function Player.newPlayer()
    local self = setmetatable({}, Player)
    return self
end

return Player