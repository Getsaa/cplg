
function loadBG()
    -- other things
    background = love.graphics.newImage("assets/bg.png")
 end

 function drawBG()
    for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
    -- draw other things
end