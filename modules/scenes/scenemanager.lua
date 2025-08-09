local SceneManager = {
    current = nil,
    prev = nil
}
SceneManager.__index = SceneManager

function SceneManager:switch(scene)
    self.prev = self.current
    self.current = scene
    if self.current.load then
        self.current:load()    
    end    
end

function SceneManager:update(dt)
    if self.current and self.current.update then
        self.current:update(dt)
    end    
end

function SceneManager:draw()
    if self.current and self.current.draw then
        self.current:draw()
    end    
end

function SceneManager:keypressed(key)
    if self.current and self.current.keypressed then
        self.current:keypressed(key)
    end    
end

return SceneManager