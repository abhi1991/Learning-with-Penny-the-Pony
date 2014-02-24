display.setStatusBar( display.HiddenStatusBar )

local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local external = require("external")
local onKeyEvent, screenGroup

function scene:willEnterScene( event )
    local group = self.view
    storyboard.removeAll()
end

function scene:createScene( event )
    screenGroup = self.view

    external.pauseMusic()

    local background = display.newImageRect("images/titlepage.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5
    screenGroup:insert(background)

    local onSound = widget.newButton
    {
        defaultFile = "images/mute.png",
        overFile = "images/sound.png",
        onRelease = function()
            storyboard.gotoScene( "menu", "fade", 400 )
        end,
    }
    onSound.x = display.contentWidth * 0.08
    onSound.y = display.contentHeight * 0.9
    onSound:scale(1,1) 
    screenGroup:insert(onSound)


    local function nextScene()
        storyboard.gotoScene( "anotherMenu", "fade", 400 )
    end

    local playButton = widget.newButton
    {
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = function()
            storyboard.gotoScene( "englishStory", "fade", 400 )
        end,
    }
    playButton.x = display.contentWidth * 0.5
    playButton.y = display.contentHeight * 0.43
    playButton:scale(2.3,2.3) -- makes the image 3x of the original size
    screenGroup:insert(playButton)

--------------   BLINK FUNCTION -------------
    local startAlpha0, startAlpha1

    function startAlpha0()
        transition.to(playButton, {alpha = 0, time = 500})
        timer.performWithDelay(500, startAlpha1, 1)
    end

    function startAlpha1()
        transition.to(playButton, {alpha = 1, time = 500})
        timer.performWithDelay(500, startAlpha0, 1)
    end

    -- startAlpha0()
----------------------------------------------

    local storyModeButton = widget.newButton
    {
        
        defaultFile = "buttons/storymode1.png",
        overFile = "buttons/storymode1_1.png",
        onRelease = nextScene,
    }
    storyModeButton.x = display.contentWidth * 0.3
    storyModeButton.y = display.contentHeight * 0.59
    storyModeButton:scale(1.5,1.5) 
    screenGroup:insert(storyModeButton)

    local howToPlayButton = widget.newButton
    {
        defaultFile = "buttons/howto1.png",
        overFile = "buttons/howto1_1.png",
        onRelease = function()
            storyboard.gotoScene( "howto", "fade", 400 )
        end,
    }
    howToPlayButton.x = display.contentWidth * 0.5
    howToPlayButton.y = display.contentHeight * 0.59
    howToPlayButton:scale(1.5,1.5) 
    screenGroup:insert(howToPlayButton)

    local function creditsFunction()
         local options =
         {
             effect = "slideDown",
             time = 300,
             isModal = true
         }
         storyboard.showOverlay("gameCredits", options)
--        storyboard.gotoScene( "gameCredits", "fade", 400 )        
    end
    
    local creditsButton = widget.newButton
    {
        defaultFile = "buttons/credits2.png",
        overFile = "buttons/credits2_2.png",
        onRelease = creditsFunction,
    }
    creditsButton.x = display.contentWidth * 0.7
    creditsButton.y = display.contentHeight * 0.59
    creditsButton:scale(1.5,1.5) 
    screenGroup:insert(creditsButton)

    

    onKeyEvent = function( event )
        local phase = event.phase
        local keyName = event.keyName
        if keyName == "back" and phase == "up" then
            if (external.getPreviousScene() == "help") or
                (external.getPreviousScene() == "story") or
                (external.getPreviousScene() == "home") then

                if condition == false then
                    condition = true
                else
                    condition = false
                    moveBack()
                end
            else
                moveBack()
            end
            return true
        else
            return false
        end
    end
    Runtime:addEventListener( "key", onKeyEvent )
end

function scene:exitScene( event )
end
function scene:overlayBegan( event )
    transition.to(screenGroup, {alpha = 0.3, time = 300})
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

