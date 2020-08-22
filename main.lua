function love.load()
    Object = require "libs.classic"

    require "classes.player"

    mapWidth = 640
    mapHeight = 480

    love.window.setMode(mapWidth, mapHeight)

    player = Player(mapWidth, mapHeight)
end

function love.keypressed(key)
    player:keypressed(key)
end

function love.keyreleased(key)
    player:keyreleased(key)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end