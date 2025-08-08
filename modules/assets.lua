local Assets = {}
Assets.__index = Assets

function Assets.assetsManager()
    local self = setmetatable({}, Assets)
    self.images = {
       player = love.graphics.newImage("assets/images/player.png"),
       player_jets = love.graphics.newImage("assets/images/player_jets.png"),
       background = love.graphics.newImage("assets/images/background.png"),
       beetlemorph = love.graphics.newImage("assets/images/beetlemorph.png"),       

    }
    self.sounds = {
        -- jump = love.audio.newSource("../assets/sounds/jump.wav", "static"),
    }
    return self
end

return Assets