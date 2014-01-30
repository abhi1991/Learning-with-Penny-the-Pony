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

    local background = display.newImageRect("images/anotherBG_1.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    external.lastPageSound()

    --STORY LINE
    local text = display.newText("For her to return home,", 100, 100, "Chinacat", 35)
    text.x = display.contentWidth * 0.5
    text.y = display.contentHeight * 0.20
    text:setTextColor(0,0,1)

    local text2 = display.newText("she needs to solve a series of problem ", 100, 100, "Chinacat", 35)
    text2.x = display.contentWidth * 0.5
    text2.y = display.contentHeight * 0.25
    text2:setTextColor(0,0,1)
    
    local text3 = display.newText("that will serve as a guide for her way back...", 100, 100, "Chinacat", 35)
    text3.x = display.contentWidth * 0.5
    text3.y = display.contentHeight * 0.30
    text3:setTextColor(0,0,1)


    local playButton = widget.newButton
    {
        
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = function()
            storyboard.gotoScene( "anotherMenu", "fade", 400 )
            external.resumeMusic()
        end,
    }
    playButton.x = display.contentWidth * 0.5
    playButton.y = display.contentHeight * 0.5
    playButton:scale(2,2) 


    local mainMenuButton = widget.newButton
    {
        
        defaultFile = "buttons/mainmenu.png",
        overFile = "buttons/mainmenuOver.png",
        onRelease = function()
            storyboard.gotoScene( "menu", "fade", 400 )
            external.resumeMusic()
        end,
    }
    mainMenuButton.x = display.contentWidth * 0.5
    mainMenuButton.y = display.contentHeight * 0.7
    mainMenuButton:scale(2,2) 

    
    screenGroup:insert(background)
    screenGroup:insert(text)
    screenGroup:insert(text2)
    screenGroup:insert(text3)
    screenGroup:insert(playButton)
    screenGroup:insert(mainMenuButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

