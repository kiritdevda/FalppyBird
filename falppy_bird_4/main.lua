push = require 'push'

Class = require 'class'

require 'Bird'
require 'Pipe'

require 'PipesPair'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

-- local variable means only accessible in this file and not outside it

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

local backgroundX_Position = 0
local groundX_Positiion = 0

local BACKGROUND_SPEED = 30
local GROUND_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413
local GROUND_LOOPING_POINT = 413

local bird = Bird()
local pipes = {}
--local pipesPair = PipesPair()

local spwanTimer = 0
local game_state = 'play'

love.graphics.keypressed = {}

function love.load()
    -- to avoid creating blurry image filter makes image smooth
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setTitle('flappy bird')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        vsync = true,
        fullscreen = false,
        resizable = true
    })
end

function love.resize(w,h)   
    push:resize(w,h)
end

function addPressedKey(key)
    love.graphics.keypressed[key] = true
--    print("In Main.Lua")
--    print(love.graphics.keypressed[key])
end

function resestPressedKey()
    love.graphics.keypressed = {}
end

function love.graphics.wasKeyPressed(key)
    --print("love.graphics.wasKeyPressed() called")
    if love.graphics.keypressed[key] then
        return true
    else
        return false
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'up' then
        --print("Up")
        --print(key)
        addPressedKey(key)
    end
end

function love.update(dt)
  if game_state == 'play' then
    spwanTimer = spwanTimer + dt
    
    backgroundX_Position = ( backgroundX_Position + BACKGROUND_SPEED * dt ) % BACKGROUND_LOOPING_POINT
    groundX_Positiion = ( groundX_Positiion + GROUND_SPEED * dt ) % GROUND_LOOPING_POINT

    bird:update(dt)
    
    if spwanTimer > 2.5 then
        table.insert( pipes, PipePair(60, 180) )
        spwanTimer = 0
    end

    resestPressedKey()

    for k, pipe in pairs(pipes) do
        pipe:update(dt)
        if bird:collide(pipe) then
            game_state = 'collide'
        end

        if pipe.pipes['top'].x < -pipe.pipes['top'].width then
            print("pipe pair removed from table")
            table.remove(pipes, k)
        end
    end
  else if game_state == 'collide' then
    bird:update(dt)
    if bird.y > VIRTUAL_HEIGHT then
        game_state = 'stop'
        
    end
  end
end

function love.draw()
    push:start()
    
    -- draw background image and ground on screen

    love.graphics.draw(background,-backgroundX_Position ,0)
    love.graphics.draw(ground,-groundX_Positiion,VIRTUAL_HEIGHT - 16)
    
    for k, pipe in pairs(pipes) do
        pipe:render()
    end
    bird:render()

    push:finish()
end
end