
Pipe = Class{}

local Pipe_Speed = 60

function Pipe:init()
    
    self.image = love.graphics.newImage('pipe.png')

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    
    self.x = VIRTUAL_WIDTH
    self.y = math.random(VIRTUAL_HEIGHT / 3, VIRTUAL_HEIGHT - 10)
    
    self.dx = 0
end

function Pipe:update(dt)
    self.x = self.x - dt * Pipe_Speed
    
 --   if self.x + self.width < 0 then
 --       self.x = VIRTUAL_WIDTH - self.width
 --       self.y = math.random(VIRTUAL_HEIGHT / 3, VIRTUAL_HEIGHT - 10)
 --   end
end

function Pipe:render()
    love.graphics.draw(self.image, self.x, self.y)
end
