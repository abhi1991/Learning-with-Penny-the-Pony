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

    local background = display.newImageRect("storyline/6.jpg", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    external.pahina5Sound()


     local nextButton = widget.newButton
    {
        defaultFile = "images/nextButton.png",
        overFile = "images/nextButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "pahinaLastStoryMode", "flip", 400 )
        end,
    }
    nextButton.x = display.contentWidth * 0.9
    nextButton.y = display.contentHeight * 0.75
    nextButton:scale(1.5,1.5) 

     local prevButton = widget.newButton
    {
        defaultFile = "images/backButton.png",
        overFile = "images/backButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "pahina4StoryMode", "flip", 400 )
        end,
    }
    prevButton.x = display.contentWidth * 0.1
    prevButton.y = display.contentHeight * 0.75
    prevButton:scale(1.5,1.5) 


    local nextButtonText = display.newText("NEXT", 0, 0, "Chinacat", 40)
    nextButtonText.x = nextButton.x
    nextButtonText.y = nextButton.y + 90
    nextButtonText:setTextColor(0,0,0)

    local prevButtonText = display.newText("BACK", 0, 0, "Chinacat", 40)
    prevButtonText.x = prevButton.x
    prevButtonText.y = prevButton.y + 90
    prevButtonText:setTextColor(0,0,0)


    --STORY LINE
    local text = display.newText("siya ay naligaw sa Fantasia at", 100, 100, "Chinacat", 40)
    text.x = display.contentWidth * 0.5
    text.y = display.contentHeight * 0.55
    text:setTextColor(0,0,1)

    local text2 = display.newText("nakalimutan ang daan niya pauwi. ", 100, 100, "Chinacat", 40)
    text2.x = display.contentWidth * 0.5
    text2.y = display.contentHeight * 0.62
    text2:setTextColor(0,0,1)

    
    screenGroup:insert(background)
    screenGroup:insert(nextButton)
    screenGroup:insert(prevButton)
    screenGroup:insert(nextButtonText)
    screenGroup:insert(prevButtonText)
    screenGroup:insert(text)
    screenGroup:insert(text2)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene