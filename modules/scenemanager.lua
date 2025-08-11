local SceneManager = {}
SceneManager.__index = SceneManager

local instace = nil

function SceneManager.new()
    local self = setmetatable({}, SceneManager)
    self.scenes = {}
    self.currentScene = nil
    self.previous = nil
    self.isTransitioning = false
    self.transitonTime = 0
    self.transitionDuration = 0.5
    self.transitionType = "fade"
    self.transitionColor = {0,0,0,1}
    self.pendingScene = nil
    self.pendingArgs = nil

    self.scenesStck = {}

    return self    
end

function SceneManager.getInstance()
    if not instace then
        instace = SceneManager.new()
    end
    return instace
end

function SceneManager:registerScene(name, scene)
    if type(scene) ~= "table" then
        error("Scene must be a table")
    end

    local requireMethods = {"load", "update", "draw", "keypressed", "mousepressed", "resize"}
    for _, method in ipairs(requireMethods) do
        if not scene[method] then
            scene[method] = function() end
        end        
    end
    
    scene.name = name
    scene.manager = self

    self.scenes[name] = scene
end

-- Switch to a scene with optional transition
function SceneManager:switchTo(sceneName, transitionType, duration, ...)
    if not self.scenes[sceneName] then
        error("Scene '" .. sceneName .. "' not found")
    end
    
    if self.isTransitioning then
        -- Queue the scene change
        self.pendingScene = sceneName
        self.pendingArgs = {...}
        return
    end
    
    transitionType = transitionType or "none"
    duration = duration or 0.5
    
    if transitionType == "none" then
        self:_immediateSwitch(sceneName, ...)
    else
        self:_startTransition(sceneName, transitionType, duration, ...)
    end
end

-- Push current scene to stack and switch to new scene
function SceneManager:push(sceneName, transitionType, duration, ...)
    
    if self.currentScene and self.currentScene.name then
        print(self.currentScene.name)
        table.insert(self.sceneStack, {
            scene = self.currentScene,
            name = self.currentScene.name
        })
    end
    self:switchTo(sceneName, transitionType, duration, ...)
end

-- Pop scene from stack and return to it
function SceneManager:pop(transitionType, duration, ...)
    if #self.sceneStack > 0 then
        local previousSceneData = table.remove(self.sceneStack)
        self:switchTo(previousSceneData.name, transitionType, duration, ...)
    end
end

-- Get current scene
function SceneManager:getCurrentScene()
    return self.currentScene
end

-- Get scene by name
function SceneManager:getScene(name)
    return self.scenes[name]
end

-- Check if transitioning
function SceneManager:isTransitioning()
    return self.isTransitioning
end

-- Internal: Immediate scene switch
function SceneManager:_immediateSwitch(sceneName, ...)
    local newScene = self.scenes[sceneName]
    
    -- Call leave on current scene
    if self.currentScene and self.currentScene.leave then
        self.currentScene:leave()
    end
    
    self.previousScene = self.currentScene
    self.currentScene = newScene
    
    -- Call enter on new scene
    if self.currentScene.enter then
        self.currentScene:enter(self.previousScene, ...)
    end
end

-- Internal: Start transition
function SceneManager:_startTransition(sceneName, transitionType, duration, ...)
    self.isTransitioning = true
    self.transitionTime = 0
    self.transitionDuration = duration
    self.transitionType = transitionType
    self.pendingScene = sceneName
    self.pendingArgs = {...}
    
    -- Set transition color based on type
    if transitionType == "fadeWhite" then
        self.transitionColor = {1, 1, 1, 1}
    else
        self.transitionColor = {0, 0, 0, 1}
    end
end

-- Internal: Complete transition
function SceneManager:_completeTransition()
    self.isTransitioning = false
    
    if self.pendingScene then
        self:_immediateSwitch(self.pendingScene, unpack(self.pendingArgs or {}))
        self.pendingScene = nil
        self.pendingArgs = nil
    end
end

-- Update method (call from love.update)
function SceneManager:update(dt)
    if self.isTransitioning then
        self.transitionTime = self.transitionTime + dt
        
        -- Switch scene at halfway point
        if self.transitionTime >= self.transitionDuration / 2 and self.pendingScene then
            self:_immediateSwitch(self.pendingScene, unpack(self.pendingArgs or {}))
            self.pendingScene = nil
            self.pendingArgs = nil
        end
        
        -- Complete transition
        if self.transitionTime >= self.transitionDuration then
            self:_completeTransition()
        end
    end
    
    -- Update current scene
    if self.currentScene then
        self.currentScene:update(dt)
    end
end

-- Draw method (call from love.draw)
function SceneManager:draw()
    -- Draw current scene
    if self.currentScene then
        self.currentScene:draw()
    end
    
    -- Draw transition overlay
    if self.isTransitioning then
        self:_drawTransition()
    end
end

-- Internal: Draw transition effect
function SceneManager:_drawTransition()
    local progress = self.transitionTime / self.transitionDuration
    local alpha = 0
    
    if self.transitionType == "fade" or self.transitionType == "fadeWhite" then
        if progress <= 0.5 then
            alpha = progress * 2
        else
            alpha = (1 - progress) * 2
        end
    elseif self.transitionType == "fadeIn" then
        alpha = 1 - progress
    elseif self.transitionType == "fadeOut" then
        alpha = progress
    end
    
    love.graphics.setColor(self.transitionColor[1], self.transitionColor[2], 
                          self.transitionColor[3], alpha)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1) -- Reset color
end

-- Forward LÖVE callbacks to current scene
function SceneManager:keypressed(key, scancode, isrepeat)
    if self.currentScene and self.currentScene.keypressed then
        self.currentScene:keypressed(key, scancode, isrepeat)
    end
end

function SceneManager:keyreleased(key, scancode)
    if self.currentScene and self.currentScene.keyreleased then
        self.currentScene:keyreleased(key, scancode)
    end
end

function SceneManager:mousepressed(x, y, button, istouch, presses)
    if self.currentScene and self.currentScene.mousepressed then
        self.currentScene:mousepressed(x, y, button, istouch, presses)
    end
end

function SceneManager:mousereleased(x, y, button, istouch, presses)
    if self.currentScene and self.currentScene.mousereleased then
        self.currentScene:mousereleased(x, y, button, istouch, presses)
    end
end

function SceneManager:mousemoved(x, y, dx, dy, istouch)
    if self.currentScene and self.currentScene.mousemoved then
        self.currentScene:mousemoved(x, y, dx, dy, istouch)
    end
end

function SceneManager:resize(w, h)
    if self.currentScene and self.currentScene.resize then
        self.currentScene:resize(w, h)
    end
end

function SceneManager:textinput(text)
    if self.currentScene and self.currentScene.textinput then
        self.currentScene:textinput(text)
    end
end

function SceneManager:wheelmoved(x, y)
    if self.currentScene and self.currentScene.wheelmoved then
        self.currentScene:wheelmoved(x, y)
    end
end

-- Scene Stack utilities
function SceneManager:getStackSize()
    return #self.sceneStack
end

function SceneManager:clearStack()
    self.sceneStack = {}
end

return SceneManager