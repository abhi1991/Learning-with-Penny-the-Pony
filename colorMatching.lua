display.setStatusBar( display.HiddenStatusBar )

local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local external = require("external")

function scene:willEnterScene( event )
    local group = self.view
    storyboard.removeAll()
end

function scene:createScene( event )
    local screenGroup = self.view

    local bigBlue = false
    local bigRed = false
    local bigGreen = false

    local background = display.newImage("anotherBG_1.png")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    local blue = display.newImage("images/blue.png")
    blue.x = display.contentWidth * 0.5
    blue.y = display.contentHeight * 0.5

    local red = display.newImage("images/red.png")
    red.x = display.contentWidth * 0.5
    red.y = display.contentHeight * 0.2

    local green = display.newImage("images/green.png")
    green.x = display.contentWidth * 0.5
    green.y = display.contentHeight * 0.8

    local backButton = widget.newButton{
        defaultFile = "images/backButton.png",    
        overFile = "images/backButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "anotherMenu", "fade", 400 )
        end,
    }   
    backButton.x = display.contentWidth * 0.1
    backButton.y = display.contentHeight * 0.9

    local function pressedBlue()
        if bigBlue == false then
            bigBlue = true
            transition.to(red, {alpha = 0, time = 1000})
            transition.to(green, {alpha = 0, time = 1000})
            transition.to(blue, {xScale = 2, yScale = 2, time = 1000})
        else
            bigBlue = false
            transition.to(red, {alpha = 1, time = 1000})
            transition.to(green, {alpha = 1, time = 1000})
            transition.to(blue, {x = green.x, y = green.y, time = 1000})
            transition.to(green, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.5})
            transition.to(blue, {xScale = 1, yScale = 1, time = 1000})
        end
    end

    blue:addEventListener("tap", pressedBlue)

    screenGroup:insert(background)
    screenGroup:insert(backButton)
    screenGroup:insert(red)
    screenGroup:insert(green)
    screenGroup:insert(blue)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

