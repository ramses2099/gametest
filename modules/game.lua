--==========================================
-- Game module
--==========================================
local Player = require("modules.player")
local Utils = require("utils.helper")
local AssetsManager = require("modules.assets")

local Game = {}
Game.__index = Game
-- Game state management --
local GameState = {
    MENU = "menu",
    PLAYING = "playing",
    PAUSED = "paused",
    GAME_OVER = "game_over"
}


function Game.newGame()
    local self = setmetatable({}, Game)
    -- init physics love 2d --
    self.PIXEL_PER_METER = 64
    love.physics.setMeter(self.PIXEL_PER_METER)
    -- self.world = love.physics.newWorld(0,9.81*self.PIXEL_PER_METER)
    self.world = love.physics.newWorld(0,0)

    self.currentState = GameState.MENU

    self.assetsmanager = AssetsManager.assetsManager()

    -- player --
    self.player = Player.newPlayer(self)

    return self
end

function Game:update(dt)
    --#region PLAYING STATE 
    if self.currentState == GameState.PLAYING then
        -- physics --
        self.world:update(dt)
        -- update player --
        self.player:update(dt)        
    end
    --#endregion PLAYING STATE
end

function Game:draw()
    if self.currentState == GameState.MENU then
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("2D Game Programming Example", 0, W_HEIGHT/2 - 60, W_WIDTH, "center")
        love.graphics.printf("Press SPACE to start", 0, W_HEIGHT/2 - 20, W_WIDTH, "center")
        love.graphics.printf("Arrow keys or WASD to move, SPACE to jump", 0, W_HEIGHT/2 + 20, W_WIDTH, "center")
    
    elseif self.currentState == GameState.PLAYING or self.currentState == GameState.PAUSED then
        -- draw player --
        self.player:draw()

        if self.currentState == GameState.PAUSED then
            love.graphics.setColor(0, 0, 0, 0.7)
            love.graphics.rectangle("fill", 0, 0, W_WIDTH, W_HEIGHT)
            love.graphics.setColor(1, 1, 1)
            love.graphics.printf("PAUSED", 0, W_HEIGHT/2, W_WIDTH, "center")
            love.graphics.printf("Press P to resume", 0, W_HEIGHT/2 + 30, W_WIDTH, "center")
        end
    elseif self.currentState == GameState.GAME_OVER then
        love.graphics.setColor(1, 0, 0)
        love.graphics.printf("GAME OVER", 0, W_HEIGHT/2 - 40, W_WIDTH, "center")
        
        -- love.graphics.setColor(1, 1, 1)
        -- love.graphics.printf("Final Score: " .. score, 0, W_HEIGHT/2, W_WIDTH, "center")
        -- love.graphics.printf("Time Survived: " .. string.format("%.1f", gameTime) .. "s", 0, W_HEIGHT/2 + 20, W_WIDTH, "center")
        -- love.graphics.printf("Press R to restart or ESC to menu", 0, W_HEIGHT/2 + 50, W_WIDTH, "center")
    end
    
end

function Game:keypressed(key)
    if self.currentState == GameState.MENU then
        if key == "space" then
            self.currentState = GameState.PLAYING
            -- Reset game state 
        elseif key =="escape" then
            love.event.quit()
        end
    elseif self.currentState == GameState.PLAYING then
        if key == "p" then
            self.currentState = GameState.PAUSED
        elseif key =="escape" then
            self.currentState = GameState.MENU        
        end
        self.player:keyinput(key)
    elseif self.currentState == GameState.PAUSED then
        if key == "p" then
            self.currentState = GameState.PLAYING
        elseif key == "escape" then
            self.currentState = GameState.MENU
        end
    elseif self.currentState == GameState.GAME_OVER then
        if key == "r" then
            self.currentState = GameState.PLAYING
            -- Reset game state
            
        elseif key == "escape" then
            self.currentState = GameState.MENU
        end
  
    end
end

return Game