local Assets = {}
Assets.__index = Assets

function Assets.assetsManager()
    local self = setmetatable({}, Assets)
    self.images = {
       -- player = love.graphics.newImage("../assets/images/player.png"),
    }
    self.sounds = {
        -- jump = love.audio.newSource("../assets/sounds/jump.wav", "static"),
    }
    
end

return Assets