local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local external = require("external")

function scene:willEnterScene( event )
    local group = self.view
end

function scene:createScene( event )
    local screenGroup = self.view

    storyboard.removeAll()
    
    local function returnThere()
     storyboard.gotoScene("colorMatching", "fade", 400)
    end

    timer.performWithDelay(500, returnThere, 1)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene



