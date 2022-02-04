function initPlayer()
    player = {
        x = 0,
        y = 0,
        layer = 1,
        speed = 0,
        angle = 0,
        health = 100,
        maxHealth = 100,
        score = 0,
        lives = 3,
        size = 1,
    }
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    player.speed = 300
    player.maxSpeed = 300
    player.angle = 0
    player.size = love.graphics.getWidth() + love.graphics.getHeight() / 2
    player.health = 100
    player.maxHealth = 100
    player.score = 0
    player.lives = 3
    player.image = love.graphics.newImage("assets/getsaa.png")
    player.pause = false
end

function updatePlayer(dt)
    -- when the player is moving, the angle is set to the direction of movement
    if player.speed > 0 then
        player.angle = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
    end
    -- maxspeed desplacement
    if love.keyboard.isDown("lshift") then
        player.speed = player.maxSpeed
    end
    -- When the player clicks the left mouse button, the player is slighly moved to the mouse position
    if love.mouse.isDown(1) then
        player.x = player.x + (love.mouse.getX() - player.x) / 10
        player.y = player.y + (love.mouse.getY() - player.y) / 10
    end

    -- When the player clicks the right mouse button, the player moves away from the mouse position
    if love.mouse.isDown(2) then
        player.x = player.x - (love.mouse.getX() - player.x) / 10
        player.y = player.y - (love.mouse.getY() - player.y) / 10
    end


    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt 
        -- make the movement smooth

    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
        -- make the movement smooth
        
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
        -- make the movement smooth
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
        -- make the movement smooth
    end
    -- When you press e, increase the speed
    if love.keyboard.isDown("e") then
        player.speed = player.speed + 1
        -- stuck at max speed
        if player.speed > player.maxSpeed then
            player.speed = player.maxSpeed
        end
    end
    -- When you press q, decrease the speed
    if love.keyboard.isDown("q") then
        player.speed = player.speed - 1
    end
    -- When you press 1, changes the image to getsaa.png
    if love.keyboard.isDown("1") then
        player.image = love.graphics.newImage("assets/getsaa.png")
    end
    -- When you press 2, changes the image to minigetsaa.png
    if love.keyboard.isDown("2") then
        player.image = love.graphics.newImage("assets/minigetsaa.png")
    end
    -- When you press 3, changes the image to valerange.png
    if love.keyboard.isDown("3") then
        player.image = love.graphics.newImage("assets/valerange.png")
    end
    -- When you press 4, changes the image to alezd.png
    if love.keyboard.isDown("4") then
        player.image = love.graphics.newImage("assets/alezd.png")
    end
    -- When you press 5, changes the image to ghost.png
    if love.keyboard.isDown("5") then
        player.image = love.graphics.newImage("assets/ghost.png")
    end
    -- When you press Control, turn the player around
    if love.keyboard.isDown("lctrl") then
        player.angle = player.angle + math.pi / dt
    end
    -- When you press R, restart the player pos
    if love.keyboard.isDown("r") then
        initPlayer()
    end
    if love.keyboard.isDown("left") then
        player.angle = player.angle - math.pi * dt
    end
    if love.keyboard.isDown("right") then
        player.angle = player.angle + math.pi * dt
    end
    if player.speed < 0 then
        player.speed = 0
    end
    if player.speed > 100 then
        player.speed = 100
    end
    if player.x < 0 then
        player.x = 0
    end
    if player.x > love.graphics.getWidth() then
        player.x = love.graphics.getWidth()
    end
    if player.y < 0 then
        player.y = 0
    end
    if player.y > love.graphics.getHeight() then
        player.y = love.graphics.getHeight()
    end
end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
        x2 < x1 + w1 and
        y1 < y2 + h2 and
        y2 < y1 + h1
end