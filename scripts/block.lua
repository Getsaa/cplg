function initBlock(block)
    block = {
        x = -40,
        y = 0,
        width = 100,
        height = 100,
        color = {
            r = 0,
            g = 0,
            b = 0,
            a = 0
        },
        type = "block",
        isSolid = true,
        isVisible = true,
        isCollidable = true,
        isDestructible = false,
    }
    block.x = love.math.random(0, love.graphics.getWidth())
    block.y = love.math.random(0, love.graphics.getHeight())
    block.color.r = love.math.random(0, 255)
    block.color.g = love.math.random(0, 255)
    block.color.b = love.math.random(0, 255)
    block.color.a = love.math.random(0, 255)
    block.width = 300
    block.height = 100
    block.isSolid = true
    block.isActive = true
    block.isCollidable = true
    block.image = love.graphics.newImage("assets/getsaa.png")
end

function drawBlock(block)
end
