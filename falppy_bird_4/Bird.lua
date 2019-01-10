
Bird = Class{}
require 'PipesPair'

local  gravity = 20
local collison = false

function Bird:init()
    self.x = VIRTUAL_WIDTH / 2
    self.y = VIRTUAL_HEIGHT / 2
    
    self.image = love.graphics.newImage('bird.png')

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    
    self.dy = 0
    self.dx = 0
end

function Bird:update(dt)
    self.y = self.y + dt * gravity 

    --print("In Bird.Lua")
    --print(love.graphics.keypressed['up'])

    if love.graphics.wasKeyPressed('up') then
        print("In If of bird.lua")
        self.y = self.y - 15
    end
end

function Bird:collide(pipesPair)
    if ( ( self.x > pipesPair.pipes['top'].x +  pipesPair.pipes['top'].width )  or (( self.x + self.width) < pipesPair.pipes['top'].x + 5 ) or ( (self.y > pipesPair.pipes['top'].y - 5 ) and ((self.y + self.height) < pipesPair.pipes['bottom'].y + 5 ))) then
        return false
    else
        collison = true
        return true
    end 
end

function Bird:render()
    if collison == true then
        love.graphics.draw(self.image, self.x, self.y, 0, 1, -1)
    else
        love.graphics.draw(self.image, self.x, self.y)
    end
end
