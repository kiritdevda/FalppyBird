
Bird = Class{}

local  gravity = 20

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

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end
