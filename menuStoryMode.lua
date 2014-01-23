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

    local background = display.newImage("images/anotherBG_1.png")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5
    
    local text = display.newText("Select a Language:", 100, 100, "Chinacat", 70)
    text.x = display.contentWidth * 0.5
    text.y = display.contentHeight * 0.28
    text:setTextColor(1,1,1)


    local engButton = widget.newButton
    {
        defaultFile = "buttons/dialect_Eng1.png",
        overFile = "buttons/dialect_Eng1_1.png",
        onRelease = function()
            storyboard.gotoScene( "page1StoryMode", "flip", 400 )
        end,
    }
    engButton.x = display.contentWidth * 0.50
    engButton.y = display.contentHeight * 0.45
    engButton:scale(2.5,2.5) 

    local tagButton = widget.newButton
    {
        defaultFile = "buttons/dialect_tag1.png",
        overFile = "buttons/dialect_tag1_1.png",
        onRelease = function()
            storyboard.gotoScene( "pahina1StoryMode", "flip", 400 )
        end,
    }
    tagButton.x = display.contentWidth * 0.50
    tagButton.y = display.contentHeight * 0.65
    tagButton:scale(2.5,2.5) 


    screenGroup:insert(background)
    screenGroup:insert(engButton)
    screenGroup:insert(tagButton)
    screenGroup:insert(text)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

