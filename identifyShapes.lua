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
    
    local moveOption1, moveOption2

    local shape, option1, option2
    local endGame = false
    local diamondDone = false
    local circleDone = false
    local squareDone = false
    local starDone = false
    local rectangleDone = false
    local ovalDone = false
    local triangleDone = false
    local option1Correct = false
    local option2Correct = false
    local randomBlackShapes, rBlack, nextButton, createOptions
    
    local bg = display.newImageRect("images/bg5.png", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)
    
    local title = display.newText("Identify the shape", 0, 0, "Chinacat", 40)
    title.x = W * 0.2725
    title.y = H * 0.2
    title:setFillColor(0,0,0)
    screenGroup:insert(title)
    
    local score = display.newText("10/10", 0, 0, "Chinacat", 40)
    score.x = display.contentWidth * 0.725
    score.y = display.contentHeight * 0.11
    score:setFillColor(0,0,0)
    screenGroup:insert(score)
    
    local function randomBlackNum()
        rBlack = math.random(1,7)
        randomBlackShapes()
    end

    function randomBlackShapes()
        if diamondDone == true and circleDone == true and squareDone == true and starDone == true and rectangleDone == true and ovalDone == true and triangleDone == true then
            nextButton.alpha = 0
            endGame = true
        else
            if rBlack == 1 then
                if diamondDone == false then
                    diamondDone = true
                    shape = display.newImage("images/shapeGame/diamondBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 2 then
                if circleDone == false then
                    circleDone = true
                    shape = display.newImage("images/shapeGame/circleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 3 then
                if squareDone == false then
                    squareDone = true
                    shape = display.newImage("images/shapeGame/squareBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 4 then
                if starDone == false then
                    starDone = true
                    shape = display.newImage("images/shapeGame/starBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 5 then
                if rectangleDone == false then
                    rectangleDone = true
                    shape = display.newImage("images/shapeGame/rectangleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 6 then
                if ovalDone == false then
                    ovalDone = true
                    shape = display.newImage("images/shapeGame/ovalBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 7 then
                if triangleDone == false then
                    triangleDone = true
                    shape = display.newImage("images/shapeGame/triangleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            end
        end
    end
    
    local function randomShapes(r)
        if r == 1 then
            return "images/shapeGame/diamond.png"
        elseif r == 2 then
            return "images/shapeGame/circle.png"
        elseif r == 3 then
            return "images/shapeGame/square.png"
        elseif r == 4 then
            return "images/shapeGame/star.png"
        elseif r == 5 then
            return "images/shapeGame/rectangle.png"
        elseif r == 6 then
            return "images/shapeGame/oval.png"
        elseif r == 7 then
            return "images/shapeGame/triangle.png"
        end
    end
    
    function createOptions()
        local randOption = math.random(1,2)
        local rand2 = math.random(1,7)

        if randOption == 1 then
            option1Correct = true
            option1 = display.newImage(randomShapes(rBlack))
            option2 = display.newImage(randomShapes(rand2))
        else
            option2Correct = true
            option2 = display.newImage(randomShapes(rBlack))          
            option1 = display.newImage(randomShapes(rand2))
        end

        option1.x = W * 0.625
        option1.y = H * 0.475
        option1:scale(0.7,0.7)

        option2.x = W * 0.875
        option2.y = H * 0.475
        option2:scale(0.7,0.7)
        
        screenGroup:insert(option1)
        screenGroup:insert(option2)
        
        option1:addEventListener("touch", moveOption1)
        option2:addEventListener("touch", moveOption2)
    end

    local function createShape()
        
        option1Correct = false
        option2Correct = false
        if shape ~= nil then
            shape:removeSelf()
        end

        if option1 ~= nil then
            option1:removeSelf()
        end

        if option2 ~= nil then
            option2:removeSelf()
        end

        randomBlackNum()
        
        if endGame == false then
            createOptions()
        end
    end
    
    local isOption1 = false
    local isOption2 = false
    
    moveOption1 = function(event)
        if isOption2 == false then
            isOption1 = true
            if event.phase == "ended" then
                if (event.x >= shape.x - 10 or event.x <= shape.x - 10) and (event.y >= shape.y - 10 or event.y <= shape.y - 10) then
                    if option1Correct == true then
                        createShape()
                    end
                end
                isOption1 = false
                transition.to(option1, {x = W * 0.625, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500}) 
            else
                if event.x <= 900 and event.x >= 60 and event.y <= 560 and event.y >= 60 then
                    option1.xScale = 1; option1.yScale = 1
                    option1.x = event.x
                    option1.y = event.y
                end
            end
        end
    end
    
    moveOption2 = function(event)
        if isOption1 == false then
            isOption2 = true
            if event.phase == "ended" then
                if (event.x >= option2.x - 10 or event.x <= option2.x - 10) and (event.y >= option2.y - 10 or event.y <= option2.y - 10) then
                    if option2Correct == true then
                        createShape()
                    end
                end
                    isOption2 = false
                    transition.to(option1, {x = W * 0.625, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500}) 
            else
                if event.x <= 900 and event.x >= 60 and event.y <= 560 and event.y >= 60 then
                    option2.xScale = 1; option2.yScale = 1
                    option2.x = event.x
                    option2.y = event.y
                end
            end
        end
    end
    
    nextButton = widget.newButton{
        defaultFile = "images/buttons/next.png",
        overFile = "images/buttons/nextOver.png",
        onRelease = function()
            createShape()
        end,
    }
    nextButton.x = W * 0.75
    nextButton.y = H * 0.78
    nextButton:scale(1.5,1.75)
    screenGroup:insert(nextButton)
    
    createShape()
    
    local restartButton = widget.newButton{
        defaultFile = "images/buttons/restart.png",
        overFile = "images/buttons/restartOver.png",
        onRelease = function()end,
    }
    restartButton.x = W * 0.625
    restartButton.y = H * 0.92
    restartButton:scale(1.5,1.75)
    screenGroup:insert(restartButton)
        
    local menuButton = widget.newButton{
        defaultFile = "images/buttons/menu.png",
        overFile = "images/buttons/menuOver.png",
        onRelease = function()
            storyboard.gotoScene("anotherMenu", "fade", 400)
        end,
    }
    menuButton.x = W * 0.875
    menuButton.y = H * 0.92
    menuButton:scale(1.5,1.75)
    screenGroup:insert(menuButton)
end

function scene:exitScene( event )
    external.setPreviousScene("identifyShapes")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

