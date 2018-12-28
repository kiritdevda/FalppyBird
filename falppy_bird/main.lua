push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

-- local variable means only accessible in this file and not outside it

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

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

function love.draw()
    push:start()
    
    -- draw background image and ground on screen

    love.graphics.draw(background,0 ,0)
    love.graphics.draw(ground,0,VIRTUAL_HEIGHT - 16)

    push:finish()
end
