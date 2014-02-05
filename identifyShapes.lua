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

    local W = display.contentWidth
    local H = display.contentHeight

    local shape, option1, option2
    
    local bg = display.newImageRect("images/9.jpg", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)
    
    local title = display.newText("Identify the shape", 0, 0, "Chinacat", 40)
    title.x = W * 0.5
    title.y = H * 0.2
    screenGroup:insert(title)
    
    local function randomShapes(r)
        if r == 1 then
            return "images/shapeGame/diamondBlack.png"
        elseif r == 2 then
            return "images/shapeGame/circleBlack.png"
        elseif r == 3 then
            return "images/shapeGame/squareBlack.png"
        elseif r == 4 then
            return "images/shapeGame/starBlack.png"
        elseif r == 5 then
            return "images/shapeGame/rectangleBlack.png"
        elseif r == 6 then
            return "images/shapeGame/ovalBlack.png"
        elseif r == 7 then
            return "images/shapeGame/triangleBlack.png"
        end
    end
    
    local option1 = display.newImage("images/shapeGame/triangle.png")
    option1.x = W * 0.7
    option1.y = H * 0.4
    option1:scale(0.4,0.4)
--    local function chooseOption()
--        
--    end
    
    local function createShape()
        local rand = math.random(1,7)
        
        if shape ~= nil then
            shape:removeSelf()
        end
        
        shape = display.newImage(randomShapes(rand))
        shape.x = W * 0.35
        shape.y = H * 0.55
    end
    
    local nextButton = display.newText("Next", 0, 0, "Chinacat", 40)
    nextButton.x = W * 0.7
    nextButton.y = H * 0.75
    
    nextButton:addEventListener("tap", createShape)
    
    createShape()
end

function scene:exitScene( event )
    external.setPreviousScene("bigSmall")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

