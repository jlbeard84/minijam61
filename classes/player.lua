Player = Object.extend(Object)

local spriteHeight = 32
local spriteWidth = 32
local playerSpeed = 300

local playerSprite

function Player:new(mapWidth, mapHeight)
    self.mapWidth = mapWidth
    self.mapHeight = mapHeight
    
    self.playerPosition = { 0, 0 }
    self.keysPressed = { left = 0, right = 0, up = 0, down = 0 }

    playerSprite = love.graphics.newImage("/sprites/player.png")
end

function Player:update(dt)
    local moveX = 0
    local moveY = 0

    print(self.keysPressed.right)

    if self.keysPressed.right == 1 then
        moveX = 1
    elseif self.keysPressed.left == 1 then
        moveX = -1
    end

    if self.keysPressed.down == 1 then
        moveY = 1
    elseif self.keysPressed.up == 1 then
        moveY = -1
    end

    local newPosX = self.playerPosition[1] + (moveX * playerSpeed * dt)
    local newPosY = self.playerPosition[2] + (moveY * playerSpeed * dt)

    print(newPosX .. ' - ' .. newPosY)

    if newPosX >= 1 and newPosX < mapWidth - spriteWidth then
        self.playerPosition[1] = newPosX
    end

    if newPosY >= 1 and newPosY < mapHeight - spriteHeight then
        self.playerPosition[2] = newPosY
    end
end

function Player:keypressed(key)
    if key == "right" then
        self.keysPressed.right = 1
    end
    
    if key == "left" then
        self.keysPressed.left = 1
    end

    if key == "down" then
        self.keysPressed.down = 1
    end

    if key == "up" then
        self.keysPressed.up = 1
    end
end

function Player:keyreleased(key)
    if key == "right" then
        self.keysPressed.right = 0
    end
    
    if key == "left" then
        self.keysPressed.left = 0
    end

    if key == "down" then
        self.keysPressed.down = 0
    end

    if key == "up" then
        self.keysPressed.up = 0
    end
end

function Player:draw()
    love.graphics.draw(playerSprite, self.playerPosition[1], self.playerPosition[2])
end