--set löve2d main.lua
local STI = require ("sti")
require "player"

function love.load()
Map = STI("map/1.lua", { "box2d" })
World = love.physics.newWorld(0, 0)
Map:box2d_init(World)
Map.layers.solid.visible = false
background = love.graphics.newImage("assets/background.png")
Player.load()
end

function love.update(dt)
    if love.keyboard.isDown("q") then
        love.event.quit()
    end
    World:update(dt)
    Player:update(dt)

end
function love.draw()
    love.graphics.draw(background, 0, 0)
    Map:draw(0, 0, 2, 2)
    love.graphics.push()
    love.graphics.scale(2, 2)

    Player:draw()

    love.graphics.pop()
end