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

    --STORY LINE
    local text = display.newText("Upang siya’y makabalik sa kaniyang bahay,", 100, 100, "Chinacat", 30)
    text.x = display.contentWidth * 0.5
    text.y = display.contentHeight * 0.20
    text:setTextColor(0,0,1)

    local text2 = display.newText("kailangan niyang malutas ang ilang problema  ", 100, 100, "Chinacat", 30)
    text2.x = display.contentWidth * 0.5
    text2.y = display.contentHeight * 0.27
    text2:setTextColor(0,0,1)
    
    local text3 = display.newText("na magsisilbing gabay sa kanyang daan pabalik...", 100, 100, "Chinacat", 30)
    text3.x = display.contentWidth * 0.5
    text3.y = display.contentHeight * 0.34
    text3:setTextColor(0,0,1)


    local playButton = widget.newButton
    {
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = function()
            storyboard.gotoScene( "anotherMenu", "fade", 400 )
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