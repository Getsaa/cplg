function initKeybinds(keybinds)
    -- Keybinds
    local keybinds = {
        -- Movement
        {
            key = "w",
            action = "move_forward",
            mode = "down",
            description = "Move up",
        },
        {
            key = "s",
            action = "move_backward",
            mode = "down",
            description = "Move down",
        },
        {
            key = "a",
            action = "move_left",
            mode = "down",
            description = "Move left",
        },
        {
            key = "d",
            action = "move_right",
            mode = "down",
            description = "Move right",
        },
        {
            key = "lctrl",
            action = "gocrazy",
            mode = "down",
            description = "gocrazymf",
        },
        {
            key = "left shift",
            action = "sprint",
            mode = "down",
            description = "Sprint",
        },
        {
            key = "left mouse button",
            action = "move",
            mode = "down",
            description = "Move player",
        },
        -- Misc
        {
            key = "q",
            action = "speed-down",
            mode = "down",
            description = "Speed down",
        },
        {
            key = "e",
            action = "speed-up",
            mode = "down",
            description = "Speed up",
        },
        {
            key = "1",
            action = "change-image",
            mode = "down",
            description = "Set skin to Getsaa",
        },
        {
            key = "2",
            action = "change-image",
            mode = "down",
            description = "Set skin to MiniGetsaa",
        },
        {
            key = "3",
            action = "change-image",
            mode = "down",
            description = "Set skin to Valerange",
        },
        {
            key = "4",
            action = "change-image",
            mode = "down",
            description = "Set skin to AleZD",
        },
        {
            key = "5",
            action = "change-image",
            mode = "down",
            description = "Set skin to GhostPower13",
        }
    }
    keybinds.key = keybinds.key or {}
    keybinds.action = keybinds.action or {}
    keybinds.mode = keybinds.mode or {}
    keybinds.description = keybinds.description or {}
    for i, v in ipairs(keybinds) do
        keybinds.key[i] = v.key
        keybinds.action[i] = v.action
        keybinds.mode[i] = v.mode
        keybinds.description[i] = v.description
    end
    keybinds.width = 0
    keybinds.height = 0
    keybinds.x = 0
    keybinds.y = 0
    keybinds.font = love.graphics.newFont(12)
    keybinds.font:setFilter("nearest", "nearest")
    keybinds.text = {}
    return keybinds
end

function drawKeybinds(keybinds)
    -- Draw keybinds
    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(love.graphics.newFont(12))
    for i, keybind in ipairs(keybinds) do
        local key = keybind.key
        local action = keybind.action
        local mode = keybind.mode
        local description = keybind.description
        local x = keybind.x
        local y = keybind.y
        local width = keybind.width
        local height = keybind.height
        local font = love.graphics.newFont(12)
        local fontSize = font:getHeight()
        local fontWidth = font:getWidth(key)
        local fontHeight = font:getHeight()
        local fontX = x + width / 2 - fontWidth / 2
        local fontY = y + height / 2 - fontHeight / 2
        local color = {255, 255, 255}
        if mode == "down" then
            color = {255, 255, 255}
        elseif mode == "up" then
            color = {255, 255, 255}
        elseif mode == "pressed" then
            color = {255, 255, 255}
        end
        love.graphics.setColor(color)
        love.graphics.rectangle("fill", x, y, width, height)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", x, y, width, height)
        love.graphics.setColor(color)
        love.graphics.print(key, fontX, fontY)
        love.graphics.print(description, x, y + height + fontSize)
    end
end

function updateKeybinds(keybinds, dt)
    if love.keyboard.isDown("f1") then
        keybinds.x = 0
        keybinds.y = 0
        keybinds.width = love.graphics.getWidth()
        keybinds.height = love.graphics.getHeight()
    end
end