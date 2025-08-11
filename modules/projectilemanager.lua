local EffectManager = require("modules.effectmanager")

local ProjectileManager = {}
ProjectileManager.__index = ProjectileManager

function ProjectileManager:init()
    local self = setmetatable({}, ProjectileManager)
    self.projectiles = {}
    return self   
end

function ProjectileManager:addProjectile(x, y, dx, dy, speed, damage, type, weapon)
    table.insert(self.projectiles, {
        x = x,
        y = y,
        dx = dx,
        dy = dy,
        speed = speed,
        type = type,
        weapon = weapon,
        life = 3.0,
        trail = {}
    })    
end

function ProjectileManager:update(dt, targets)
    for i = #self.projectiles, 1, -1 do
        local proj = self.projectiles[i]

        -- Update position
        proj.x = proj.x + proj.dx * proj.speed * dt
        proj.y = proj.y + proj.dy * proj.speed * dt
        proj.life = proj.life - dt

        -- add trail
        table.insert(proj.trail, 1, {x = proj.x, y = proj.y, alpha = 1.0})
        if #proj.trail > 8 then
            table.remove(proj.trail)
        end
        
        -- update trail
        for j, point in ipairs(proj.trail) do
            point.alpha = point.alpha * 0.9
        end


        -- check bounds and lifetime
        if proj.x < 0 or proj.x > W_WIDTH or proj.y < 0 or proj.y > W_HEIGHT or proj.life <= 0 then
            table.remove(self.projectiles, i)
        else
            local hit  = false
            for j, target in ipairs(targets) do
                local dx = proj.x - target.x
                local dy = proj.y - target.y
                local dist = math.sqrt(dx * dx + dy * dy)

                if dist < target.radius then
                    if proj.type == "rocket" then
                        -- explode damage
                        self:explode(proj.x, proj.y, proj.weapon.explosionRadius, proj.damage, targets)
                    else
                        -- direct damage
                        target.health = target.health - proj.damage
                        EffectManager:addImpact(proj.x, proj.y)
                    end
                    
                    hit = true

                    -- Remove projectiles unless it projectiles    
                    if not proj.weapon.penetration then 
                        break
                    end
                end            
            end

            if hit and not proj.weapon.penetration then
                table.remove(self.projectiles, i)
            end
        end
    end    
end

function ProjectileManager:explode(x, y, radius, damage, targets)
    --EffectManager
    EffectManager:addImpact(x, y)

    -- Damage all targets in range
    for _, target in ipairs(targets) do
        local dx = target.x - x
        local dy = target.y - y
        local dist = math.sqrt(dx * dx + dy * dy)

        if dist < radius then
            local falloff = 1 - (dist / radius)
            target.health = target.health - damage * falloff
        end
    end
end

function ProjectileManager:draw()
    for _, proj in ipairs(self.projectiles) do
        for i, point in ipairs(proj.trail) do
            local alpha = point.alpha * 0.5
            if proj.trail == "rail" then
                love.graphics.setColor(0,1,1,alpha)
            elseif proj.type == "rocket" then
                love.graphics.setColor(1,0.5,0,alpha)
            else
                love.physics.setColor(1, 1, 0, alpha)
            end
            love.graphics.circle("fill", point.x, point.y, 2 * alpha)
        end
        
        -- Draw projectile
        if proj.type == "rail" then
            love.graphics.setColor(0, 1, 1)
            love.graphics.circle("fill", proj.x, proj.y, 3)
        elseif proj.type == "rocket" then
            love.graphics.setColor(1, 0.3, 0)
            love.graphics.circle("fill", proj.x, proj.y, 4)
        else
            love.graphics.setColor(1,1,0)
            love.graphics.circle("fill", proj.x, proj.y, 2)          
        end


    end

end


return ProjectileManager