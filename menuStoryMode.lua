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

    local background = display.newImageRect("images/anotherBG_4.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    -- Option for: English
    local engButton = widget.newButton
    {
        defaultFile = "buttons/english1.png",
        overFile = "buttons/english1_1.png",
        onRelease = function()
            storyboard.gotoScene( "menu", "fade", 400 )
        end,
    }
    engButton.x = display.contentWidth * 0.50
    engButton.y = display.contentHeight * 0.43
    engButton:scale(2,2) 

    -- Option for: Tagalog
    local tagButton = widget.newButton
    {
        defaultFile = "buttons/tagalog1.png",
        overFile = "buttons/tagalog1_1.png",
        onRelease = function()
            storyboard.gotoScene( "menuTagalog", "fade", 400 )
        end,
    }
    tagButton.x = display.contentWidth * 0.50
    tagButton.y = display.contentHeight * 0.58
    tagButton:scale(2,2) 

    screenGroup:insert(background)
    screenGroup:insert(engButton)
    screenGroup:insert(tagButton)

end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

