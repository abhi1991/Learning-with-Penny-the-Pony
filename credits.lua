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

    local background = display.newImageRect("images/how3.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5
    screenGroup:insert(background)

    local backButton = widget.newButton{
        defaultFile = "buttons/back1_1.png",
        overFile = "buttons/back1.png",
        onRelease = function()
            storyboard.gotoScene("menu", "fade", 400)
        end,    
    }
    backButton.x = display.contentWidth * 0.5
    backButton.y = display.contentHeight * 0.95
    screenGroup:insert(backButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene



