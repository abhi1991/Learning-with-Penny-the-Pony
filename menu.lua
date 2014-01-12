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

    external.playMusic()

    local background = display.newImage("images/yellow-clouds-hd-wallpaper.jpg")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    local function goToGame()
        storyboard.gotoScene( "balloonGame", "fade", 400 )
    end

    local playButton = widget.newButton
    {
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = goToGame,
    }
    playButton.x = display.contentWidth * 0.5
    playButton.y = display.contentHeight * 0.1
    playButton:scale(3,3) -- makes the image 3x of the original size

    local settingsButton = widget.newButton
    {
        defaultFile = "buttons/settings1.png",
        overFile = "buttons/settings1_1.png",
        onRelease = goToGame,
    }
    settingsButton.x = display.contentWidth * 0.5
    settingsButton.y = display.contentHeight * 0.3
    settingsButton:scale(3,3) -- makes the image 3x of the original size

    local howToPlayButton = widget.newButton
    {
        defaultFile = "buttons/howto1.png",
        overFile = "buttons/howto1_1.png",
        onRelease = goToGame,
    }
    howToPlayButton.x = display.contentWidth * 0.5
    howToPlayButton.y = display.contentHeight * 0.5
    howToPlayButton:scale(3,3) -- makes the image 3x of the original size

    local storyModeButton = widget.newButton
    {
        defaultFile = "buttons/storymode1.png",
        overFile = "buttons/storymode1_1.png",
        onRelease = goToGame,
    }
    storyModeButton.x = display.contentWidth * 0.5
    storyModeButton.y = display.contentHeight * 0.7
    storyModeButton:scale(3,3) -- makes the image 3x of the original size

    local exitButton = widget.newButton
    {
        defaultFile = "buttons/exit1.png",
        overFile = "buttons/exit1_1.png",
        onRelease = goToGame,
    }
    exitButton.x = display.contentWidth * 0.5
    exitButton.y = display.contentHeight * 0.9
    exitButton:scale(3,3) -- makes the image 3x of the original size


    -- screenGroup groups all the images. IMPORTANT to add all items inside the screenGroup (images and texts only)
    screenGroup:insert(background)
    screenGroup:insert(playButton)
    screenGroup:insert(settingsButton)
    screenGroup:insert(howToPlayButton)
    screenGroup:insert(storyModeButton)
    screenGroup:insert(exitButton)
end



function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

