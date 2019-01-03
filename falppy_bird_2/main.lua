push = require 'push'

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

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    backgroundX_Position = ( backgroundX_Position + BACKGROUND_SPEED * dt ) % BACKGROUND_LOOPING_POINT
    
    groundX_Positiion = ( groundX_Positiion + GROUND_SPEED * dt ) % GROUND_LOOPING_POINT

end

function love.draw()
    push:start()
    
    -- draw background image and ground on screen

    love.graphics.draw(background,-backgroundX_Position ,0)
    love.graphics.draw(ground,-groundX_Positiion,VIRTUAL_HEIGHT - 16)

    push:finish()
end
