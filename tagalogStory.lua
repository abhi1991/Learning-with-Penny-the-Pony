local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local external = require("external")

local onKeyEvent

-- function scene:willEnterScene( event )
--     local group = self.view
--     storyboard.removeAll()
-- end

function scene:createScene( event )
    local screen = self.view
    local page = 0
    local homeButton, backButton, nextButton

    external.pauseMusic()
    external.pahina1Sound()

    -- STORY LINE --
    local image1 = display.newImageRect("storyline/FINAL/tag1.png", display.contentWidth, display.contentHeight)
    image1.x = display.contentWidth * 0.5
    image1.y = display.contentHeight * 0.5
    screen:insert(image1)
    
    local image2 = display.newImageRect("storyline/FINAL/tag2.png", display.contentWidth, display.contentHeight)
    image2.x = display.contentWidth * 0.5
    image2.y = display.contentHeight * 0.5
    image2.alpha = 0
    screen:insert(image2)
    
    local image3 = display.newImageRect("storyline/FINAL/tag3.png", display.contentWidth, display.contentHeight)
    image3.x = display.contentWidth * 0.5
    image3.y = display.contentHeight * 0.5
    image3.alpha = 0
    screen:insert(image3)
    
    local image4 = display.newImageRect("storyline/FINAL/tag4.png", display.contentWidth, display.contentHeight)
    image4.x = display.contentWidth * 0.5
    image4.y = display.contentHeight * 0.5
    image4.alpha = 0
    screen:insert(image4)
    
    local image5 = display.newImageRect("storyline/FINAL/tag5.png", display.contentWidth, display.contentHeight)
    image5.x = display.contentWidth * 0.5
    image5.y = display.contentHeight * 0.5
    image5.alpha = 0
    screen:insert(image5)
    
    local image6 = display.newImageRect("storyline/FINAL/tag6.png", display.contentWidth, display.contentHeight)
    image6.x = display.contentWidth * 0.5
    image6.y = display.contentHeight * 0.5
    image6.alpha = 0
    screen:insert(image6)


    -- HOME BUTTON --
    homeButton = widget.newButton{
        defaultFile = "images/homeButton.png",
        overFile = "images/homeButtonOver.png",
        onRelease = function()
            storyboard.gotoScene("menuTagalog", "fade", 400)
        end,
    }
    homeButton.x = display.contentWidth * 0.1
    homeButton.y = display.contentHeight * 0.88
    homeButton:scale(1.5,1.5)
    homeButton.alpha = 0.9
    screen:insert(homeButton)


    -- STORY MODE MENU BUTTON --
    gamePlayButton = widget.newButton{
        defaultFile = "images/buttons/start.png",
        overFile = "images/buttons/startOver.png",
        onRelease = function()
            storyboard.gotoScene("storyTagalog_colorMatching", "fade", 400)
        end,
    }
    gamePlayButton.x = display.contentWidth * 0.9
    gamePlayButton.y = display.contentHeight * 0.88
    gamePlayButton:scale(1.5,1.5)
    gamePlayButton.alpha = 0
    screen:insert(gamePlayButton)


    -- BACK BUTTON --
    backButton = widget.newButton{
        defaultFile = "images/back.png",
        overFile = "images/backover.png",
        onRelease = function()
            page = page - 1
            if page == 0 then
                homeButton.x = backButton.x
                homeButton.y = backButton.y
                homeButton.alpha = 0.9
                backButton.alpha = 0
                gamePlayButton.alpha = 0
                external.pahina1Sound()
                transition.to(image1, {alpha = 1, time = 400})
                transition.to(image2, {alpha = 0, time = 400})
                transition.to(image1, {x = display.contentWidth * 0.5, time = 400})
            elseif page == 1 then
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                nextButton.alpha = 0.9
                external.pahina2Sound()
                transition.to(image2, {alpha = 1, time = 400})
                transition.to(image3, {alpha = 0, time = 400})
                transition.to(image2, {x = display.contentWidth * 0.5, time = 400})
            elseif page == 2 then
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                nextButton.alpha = 0.9
                external.pahina3Sound()
                transition.to(image3, {alpha = 1, time = 400})
                transition.to(image4, {alpha = 0, time = 400})
                transition.to(image3, {x = display.contentWidth * 0.5, time = 400})
            elseif page == 3 then
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                nextButton.alpha = 0.9
                external.pahina4Sound()
                transition.to(image4, {alpha = 1, time = 400})
                transition.to(image5, {alpha = 0, time = 400})
                transition.to(image4, {x = display.contentWidth * 0.5, time = 400})
            elseif page == 4 then
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                nextButton.alpha = 0.9
                external.pahina5Sound()
                transition.to(image5, {alpha = 1, time = 400})
                transition.to(image6, {alpha = 0, time = 400})
                transition.to(image5, {x = display.contentWidth * 0.5, time = 400})
            elseif page == 5 then
                homeButton.x = nextButton.x
                homeButton.y = nextButton.y
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                nextButton.alpha = 0.9
                external.hulingSound()
                transition.to(image6, {alpha = 1, time = 400})
                transition.to(image7, {alpha = 0, time = 400})
                transition.to(image6, {x = display.contentWidth * 0.5, time = 400})
            end
        end,
    }
    backButton.x = display.contentWidth * 0.1
    backButton.y = display.contentHeight * 0.88
    backButton:scale(1.5,1.5) 
    backButton.alpha = 0
    screen:insert(backButton)

    
    -- NEXT BUTTON --
    nextButton = widget.newButton{
        defaultFile = "images/next.png",
        overFile = "images/nextover.png",
        onRelease = function()
            page = page + 1
            if page == 1 then
                homeButton.alpha = 0
                gamePlayButton.alpha = 0
                backButton.alpha = 0.9
                transition.to(image1, {alpha = 0, time = 400})
                transition.to(image2, {alpha = 1, time = 400})
                external.pahina2Sound()
                transition.to(image1, {x = display.contentWidth * -1, time = 400})
            elseif page == 2 then
                gamePlayButton.alpha = 0
                transition.to(image2, {alpha = 0, time = 400})
                transition.to(image3, {alpha = 1, time = 400})
                external.pahina3Sound()
                transition.to(image2, {x = display.contentWidth * -1, time = 400})
            elseif page == 3 then
                gamePlayButton.alpha = 0
                transition.to(image3, {alpha = 0, time = 400})
                transition.to(image4, {alpha = 1, time = 400})
                external.pahina4Sound()
                transition.to(image3, {x = display.contentWidth * -1, time = 400})
            elseif page == 4 then
                gamePlayButton.alpha = 0
                transition.to(image4, {alpha = 0, time = 400})
                transition.to(image5, {alpha = 1, time = 400})
                external.pahina5Sound()
                transition.to(image4, {x = display.contentWidth * -1, time = 400})
            elseif page == 5 then
                gamePlayButton.x = nextButton.x
                gamePlayButton.y = nextButton.y
                gamePlayButton.alpha = 0.9
                nextButton.alpha = 0 
                external.hulingSound()
                transition.to(image5, {alpha = 0, time = 400})
                transition.to(image6, {alpha = 1, time = 400})
                transition.to(image5, {x = display.contentWidth * -1, time = 400})
             end
        end,
    }
    nextButton.x = display.contentWidth * 0.9
    nextButton.y = display.contentHeight * 0.88
    nextButton:scale(1.5,1.5)
    nextButton.alpha = 0.9
    screen:insert(nextButton)


    onKeyEvent = function( event )
        local phase = event.phase
        local keyName = event.keyName
        if keyName == "back" and phase == "up" then
            storyboard.gotoScene( "menuTagalog", "fade", 300 )
            return true
        else
            return false
        end
    end
    
    Runtime:addEventListener( "key", onKeyEvent )
end


function scene:willEnterScene( event )
    print("Settings loaded...")
    storyboard.removeAll()
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

