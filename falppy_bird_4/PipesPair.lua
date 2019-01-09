PipePair = Class{}

local Pipe_Speed = 60


function PipePair:init(gap, y)
    self.y = y
    self.pipes = {top = Pipe('top',y - gap),
                bottom = Pipe('bottom', y) }
end

function PipePair:update(dt)
    self.pipes['top']:update(dt)
    self.pipes['bottom']:update(dt)
end

function PipePair:render()
    self.pipes['top']:render()
    self.pipes['bottom']:render()
end
