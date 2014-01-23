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

    local background = display.newImage("storyline/4.jpg")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5


     local nextButton = widget.newButton
    {
        defaultFile = "images/nextButton.png",
        overFile = "images/nextButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "pahina4StoryMode", "flip", 400 )
        end,
    }
    nextButton.x = display.contentWidth * 0.99
    nextButton.y = display.contentHeight * 0.85
    nextButton:scale(1.5,1.5) 

     local prevButton = widget.newButton
    {
        defaultFile = "images/backButton.png",
        overFile = "images/backButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "pahina2StoryMode", "flip", 400 )
        end,
    }
    prevButton.x = display.contentWidth * 0
    prevButton.y = display.contentHeight * 0.85
    prevButton:scale(1.5,1.5) 


    local nextButtonText = display.newText("NEXT", 0, 0, "Chinacat", 50)
    nextButtonText.x = nextButton.x
    nextButtonText.y = nextButton.y + 90
    nextButtonText:setTextColor(0,0,0)

    local prevButtonText = display.newText("BACK", 0, 0, "Chinacat", 50)
    prevButtonText.x = prevButton.x
    prevButtonText.y = prevButton.y + 90
    prevButtonText:setTextColor(0,0,0)


    local text2 = display.newText("kinahihiligan niya ang paggalugad sa Fantasia   ", 100, 100, "Chinacat", 50)
    text2.x = display.contentWidth * 0.35
    text2.y = display.contentHeight * 0.35
    text2:setTextColor(0,0,1)
    
    local text3 = display.newText("at nakakauwi naman ito bago pa dumilim.kahit ", 100, 100, "Chinacat", 50)
    text3.x = display.contentWidth * 0.5
    text3.y = display.contentHeight * 0.42
    text3:setTextColor(0,0,1)

    local text4 = display.newText("ito’y masyadong malaki para sa kanya at  ", 100, 100, "Chinacat", 50)
    text4.x = display.contentWidth * 0.7
    text4.y = display.contentHeight * 0.49
    text4:setTextColor(0,0,1)

    local text5 = display.newText("nakakauwi naman ito bago pa dumilim.", 100, 100, "Chinacat", 50)
    text5.x = display.contentWidth * 0.6
    text5.y = display.contentHeight * 0.56
    text5:setTextColor(0,0,1)

    
    screenGroup:insert(background)
    screenGroup:insert(nextButton)
    screenGroup:insert(prevButton)
    screenGroup:insert(nextButtonText)
    screenGroup:insert(prevButtonText)
    screenGroup:insert(text2)
    screenGroup:insert(text3)
    screenGroup:insert(text4)
    screenGroup:insert(text5)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene