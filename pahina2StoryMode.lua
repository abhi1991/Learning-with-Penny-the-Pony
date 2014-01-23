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

    local background = display.newImage("storyline/3.jpg")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5


     local nextButton = widget.newButton
    {
        defaultFile = "images/nextButton.png",
        overFile = "images/nextButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "pahina3StoryMode", "flip", 400 )
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
            storyboard.gotoScene( "pahina1StoryMode", "flip", 400 )
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


    --STORY LINE
    local text = display.newText("Bilang isang pony na malakas ang loob,", 100, 100, "Chinacat", 50)
    text.x = display.contentWidth * 0.5
    text.y = display.contentHeight * 0.30
    text:setTextColor(0,0,1)

    



    
    screenGroup:insert(background)
    screenGroup:insert(nextButton)
    screenGroup:insert(prevButton)
    screenGroup:insert(nextButtonText)
    screenGroup:insert(prevButtonText)
    screenGroup:insert(text)
    
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene
