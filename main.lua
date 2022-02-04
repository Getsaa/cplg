require "scripts/player"
require "scripts/bg"
require "scripts/block"
require "conf"
local moonshine = require 'moonshine'

function love.load()
    initPlayer()
    loadBG()
    effect = moonshine(moonshine.effects.scanlines).chain(moonshine.effects.crt)
effect.scanlines.width = 3
effect.scanlines.opacity = 0.5
    initBlock()
end

function love.update(dt)
    updatePlayer(dt)
end

function love.draw()
    drawBlock()
    drawBG()
end

function love.draw()
    effect(function()
        drawBG()
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", player.x, player.y, 4, 4)
        love.graphics.print("FPS: " .. love.timer.getFPS(), 20, 20)
        love.graphics.print("Player Speed: " .. player.speed, 20, 40)
        love.graphics.print("Press E to increase speed, and Q to decrease", 20, 60)
        love.graphics.print("Press the numbers to change the player skin", 20, 80)
        love.graphics.print("Press R to restart the player", 20, 100)
        love.graphics.print("Press Shift to sprint", 20, 120)
        love.graphics.print("Move with WASD or Mouse", 20, 140)
        -- Put a text below at the bottom of the screen
        love.graphics.print("GD Cubes Playground (CPLG) 0.5 - by Getsaa", 530, 730)
        love.graphics.draw(player.image, player.x, player.y, player.angle, 1, 1, player.image:getWidth() / 2, player.image:getHeight() / 2)
        drawBlock()
            -- Replace the cursor with the cursor.png image
    love.mouse.setCursor(love.mouse.newCursor("assets/cursor.png", 0, 0))
    end)
end

function love.keypressed(key)
    -- If you press escape, close the game
    if key == "escape" then
        love.event.quit()
    end
    -- if you press f11, toggle fullscreen
    if key == "f11" then
        love.window.setFullscreen(not love.window.getFullscreen())
    end
end
