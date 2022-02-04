function initEnemy(enemy)
    enemy = {
        type = "enemy",
        x = 0,
        y = 0,
        width = 60,
        height = 60,
        speed = 5,
    }
    enemy.name = "Enemy"
    enemy.type = "enemy"
    enemy.sprite = love.graphics.newImage("assets/getsaa.png")
    enemy.x = 0
    enemy.y = 0
    enemy.speed = 1
    enemy.health = 1
    enemy.maxHealth = 1
    enemy.damage = 1
end

function updateEnemy(enemy, dt)
    enemy.y = enemy.y + enemy.speed * math.sin(enemy.angle) * dt
    if enemy.x < 0 or enemy.x > love.graphics.getWidth() or enemy.y < 0 or enemy.y > love.graphics.getHeight() then
        enemy.isActive = false
    end
end

function drawEnemy(enemy)
    love.graphics.draw(enemy.sprite, enemy.x, enemy.y, enemy.angle, 1, 1, enemy.sprite:getWidth() / 2, enemy.sprite:getHeight() / 2)
end