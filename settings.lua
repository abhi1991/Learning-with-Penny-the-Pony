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

    local settingsTitle = display.newText("Settings", 100, 100, "Chinacat", 70)
    settingsTitle.x = display.contentWidth * 0.5
    settingsTitle.y = display.contentHeight * 0.22
    settingsTitle:setTextColor(1,1,1)

    local sound = display.newText("Music: ", 100, 100, "Chinacat", 50)
    sound.x = display.contentWidth * 0.25
    sound.y = display.contentHeight * 0.34
    sound:setTextColor(1,1,1)

    local soundEffectLabel = display.newText("Sound Effects: ", 0,0, "Chinacat", 50)
    soundEffectLabel.x = display.contentWidth * 0.36
    soundEffectLabel.y = display.contentHeight * 0.45
    soundEffectLabel:setFillColor(1,1,1)

    local music = widget.newSwitch
    {
        left = 250,
        top = 230,
        id = "Turn off music",
        --initialSwitchState = musicState,
        initialSwitchState = true,
--        onRelease = musicFunction, 
--        onPress = musicFunction
    }
    music.x = display.contentWidth/2 + 175
    music.y = sound.y
    music:scale(1.25,1.25)

    local soundfx = widget.newSwitch
    {
        left = 250,
        top = 230,
        id = "Turn off external",
        --initialSwitchState = externalState,
        initialSwitchState = true,
--        onRelease = soundFunction,
--        onPress = soundFunction
    }
    soundfx.x = display.contentWidth/2 + 175
    soundfx.y = soundEffectLabel.y
    soundfx:scale(1.25,1.25)


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

    
    screenGroup:insert(background)
    screenGroup:insert(settingsTitle)
    screenGroup:insert(sound)
    screenGroup:insert(soundfx)
    screenGroup:insert(music)
    screenGroup:insert(soundEffectLabel)
    screenGroup:insert(backButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene