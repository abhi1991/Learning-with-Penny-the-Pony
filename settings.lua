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

    local background = display.newImage("images/anotherBorder.png")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    local settingsTitle = display.newText("Credits", 100, 100, "Chinacat", 70)
    settingsTitle.x = display.contentWidth * 0.5
    settingsTitle.y = display.contentHeight * 0.22
    settingsTitle:setTextColor(1,1,1)

    local musicLabel = display.newText("Music: ", 0,0, "Chinacat", 40)
    musicLabel.x = display.contentWidth * 0.25
    musicLabel.y = display.contentHeight * 0.35
    musicLabel:setFillColor(50,50,50)
    
    local soundEffectLabel = display.newText("Sound Effects: ", 0,0, "Chinacat", 40)
    soundEffectLabel.x = display.contentWidth * 0.36
    soundEffectLabel.y = display.contentHeight * 0.45
    soundEffectLabel:setFillColor(50,50,50)

    


    local backButton = widget.newButton
    {
        defaultFile = "buttons/back1_1.png",
        overFile = "buttons/back1.png",
        onRelease = function()
            storyboard.gotoScene( "menu", "flip", 400 )
        end,
    }
    backButton.x = display.contentWidth * 0.50
    backButton.y = display.contentHeight * 0.70
    backButton:scale(2,2) 

    local function goToMenu(event)
--        storyboard.gotoScene( "menu", "fade", 300 )
        storyboard.hideOverlay(true, "slideRight", 400)
    end

    
    screenGroup:insert(background)
    screenGroup:insert(settingsTitle)
    screenGroup:insert(music)
    screenGroup:insert(sound)
    screenGroup:insert(musicLabel)
    screenGroup:insert(soundEffectLabel)
    screenGroup:insert(backButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene