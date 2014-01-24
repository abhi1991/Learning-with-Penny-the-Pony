display.setStatusBar( display.HiddenStatusBar )

local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()


function scene:willEnterScene( event )
    local group = self.view
    storyboard.removeAll()
end

function scene:createScene( event )
    local screenGroup = self.view


    local W = display.contentWidth
    local H = display.contentHeight

    local color = {}
    local colorCount = 0

    local bg = display.newImageRect("images/anotherBG_1.png", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5

    local kind

    local option1 = display.newImage("images/circle_yellow.png")
    option1.x = W * 0.5; option1.y = H * 0.3
    local option2 = display.newImage("images/circle_yellow.png")
    option2.x = W * 0.5; option2.y = H * 0.3
    local option3 = display.newImage("images/circle_yellow.png")
    option3.x = W * 0.5; option3.y = H * 0.3

    local function random()
        local rand = math.random(1,4)

        if rand == 1 then
            color[colorCount] = display.newImage("images/circle_green.png")
            kind = "green"
        elseif rand == 2 then
            color[colorCount] = display.newImage("images/circle_yellow.png")
            kind = "yellow"
        elseif rand == 3 then
            color[colorCount] = display.newImage("images/circle_blue.png")
            kind = "blue"
        elseif rand == 4 then
            color[colorCount] = display.newImage("images/circle_red.png")
            kind = "red"
        end

        color[colorCount].x = W * 0.5
        color[colorCount].y = H * 0.3
        color[colorCount]:scale(2.5,2.5)

        transition.to(option1, {x = W * 0.3, y = H * 0.7})
        transition.to(option2, {x = W * 0.5, y = H * 0.7})
        transition.to(option3, {x = W * 0.7, y = H * 0.7})
        -- screenGroup:insert(color[colorCount])

        colorCount = colorCount + 1
    end

    random()

    screenGroup:insert(bg)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

