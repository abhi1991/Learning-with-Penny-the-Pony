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

    

    local background = display.newImageRect("images/titlepage.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    local function nextScene()
        storyboard.gotoScene( "anotherMenu", "fade", 400 )
    end

    local playButton = widget.newButton
    {
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = nextScene,
    }
    playButton.x = display.contentWidth * 0.5
    playButton.y = display.contentHeight * 0.40
    playButton:scale(2,2) -- makes the image 3x of the original size

    local settingsButton = widget.newButton
    {
        defaultFile = "buttons/settings1.png",
        overFile = "buttons/settings1_1.png",
        onRelease = function()
            storyboard.gotoScene( "settings", "fade", 400 )
        end,
    }
    settingsButton.x = display.contentWidth * 0.4
    settingsButton.y = display.contentHeight * 0.56
    settingsButton:scale(1.5,1.5) 

    local storyModeButton = widget.newButton
    {
        defaultFile = "buttons/storymode1.png",
        overFile = "buttons/storymode1_1.png",
        onRelease = function()
            storyboard.gotoScene( "menuStoryMode", "fade", 400 )
        end,
    }
    storyModeButton.x = display.contentWidth * 0.2
    storyModeButton.y = display.contentHeight * 0.56
    storyModeButton:scale(1.5,1.5) 

    local howToPlayButton = widget.newButton
    {
        defaultFile = "buttons/howto1.png",
        overFile = "buttons/howto1_1.png",
        onRelease = function()
            storyboard.gotoScene( "empty", "fade", 400 )
        end,
    }
    howToPlayButton.x = display.contentWidth * 0.6
    howToPlayButton.y = display.contentHeight * 0.56
    howToPlayButton:scale(1.5,1.5) 

    local creditsButton = widget.newButton
    {
        defaultFile = "buttons/credits2.png",
        overFile = "buttons/credits2_2.png",
        onRelease = function()
            storyboard.gotoScene( "credits", "fade", 400 )
        end,
    }
    creditsButton.x = display.contentWidth * 0.8
    creditsButton.y = display.contentHeight * 0.56
    creditsButton:scale(1.5,1.5) 

    -- screenGroup groups all the images. IMPORTANT to add all items inside the screenGroup (images and texts only)
    screenGroup:insert(background)
    screenGroup:insert(playButton)
    screenGroup:insert(settingsButton)
    screenGroup:insert(storyModeButton)
    screenGroup:insert(howToPlayButton)
    screenGroup:insert(creditsButton)
end

function scene:exitScene( event )
end
function scene:overlayBegan( event )
    transition.to(screenGroup, {alpha = 0.1, time = 300})
end

function scene:overlayEnded( event )
    transition.to(screenGroup, {alpha = 1, time = 300})
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )
scene:addEventListener("overlayBegan", scene)
scene:addEventListener("overlayEnded", scene)

return scene

