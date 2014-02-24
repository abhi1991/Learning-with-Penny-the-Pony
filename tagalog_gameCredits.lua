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

    local image = display.newImage("images/credits.png")
    image.x = display.contentWidth * 0.5
    image.y = display.contentHeight * 0.5
    image:scale(1,1)
    screenGroup:insert(image)

    local backButton = widget.newButton{
        defaultFile = "images/buttons/menu.png",
        overFile = "images/buttons/menuOver.png",
        onRelease = function()
            storyboard.hideOverlay(true, "slideUp", 400)
        end,    
    }
    backButton.x = display.contentWidth * 0.5
    backButton.y = display.contentHeight * 0.85
    backButton:scale(2,2)
    screenGroup:insert(backButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene





