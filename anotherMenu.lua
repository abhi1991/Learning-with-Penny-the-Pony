display.setStatusBar( display.HiddenStatusBar )

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

    local background = display.newImage("images/anotherBG_1.png")
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    --INSERT BUTTONS
    local gameOne = display.newImage("buttons/colorMatch.png")
    gameOne.x = display.contentWidth * 0
    gameOne.y = display.contentHeight * 0.25
    gameOne:scale(1.2,1.2)

    local gameTwo = display.newImage("buttons/bigsmall.png")
    gameTwo.x = display.contentWidth * 0.45
    gameTwo.y = display.contentHeight * 0.25
    gameTwo:scale(1.2,1.2)

    local gameThree = display.newImage("buttons/shapes.png")
    gameThree.x = display.contentWidth * 0.9
    gameThree.y = display.contentHeight * 0.25
    gameThree:scale(1.2,1.2)

    local gameFour = display.newImage("buttons/numbers.png")
    gameFour.x = display.contentWidth * 0
    gameFour.y = display.contentHeight * 0.48
    gameFour:scale(1.2,1.2)

    local gameFive = display.newImage("buttons/balloonPop.png")
    gameFive.x = display.contentWidth * 0.45
    gameFive.y = display.contentHeight * 0.48
    gameFive:scale(1.2,1.2)

    local gameSix = display.newImage("buttons/tracing.png")
    gameSix.x = display.contentWidth * 0.9
    gameSix.y = display.contentHeight * 0.48
    gameSix:scale(1.2,1.2)

    local gameSeven = display.newImage("buttons/alphabets.png")
    gameSeven.x = display.contentWidth * 0.45
    gameSeven.y = display.contentHeight * 0.72
    gameSeven:scale(1.2,1.2)
    --END INSERT BUTTONS

    --INSERT TEST FOR BUTTONS
    local gameOneText = display.newText("Color Matching", 0, 0, "Chinacat", 30)
    gameOneText.x = gameOne.x
    gameOneText.y = gameOne.y + 115
    gameOneText:setTextColor(0,0,0)
   
    local gameTwoText = display.newText("Big and Small", 0, 0, "Chinacat", 30)
    gameTwoText.x = gameTwo.x
    gameTwoText.y = gameTwo.y + 115
    gameTwoText:setTextColor(0,0,0)

    local gameThreeText = display.newText("Identify Shapes", 0, 0, "Chinacat", 30)
    gameThreeText.x = gameThree.x
    gameThreeText.y = gameThree.y + 115
    gameThreeText:setTextColor(0,0,0)

    local gameFourText = display.newText("Counting Numbers", 0, 0, "Chinacat", 30)
    gameFourText.x = gameFour.x
    gameFourText.y = gameFour.y + 115
    gameFourText:setTextColor(0,0,0)

    local gameFiveText = display.newText("Pop Balloons", 0, 0, "Chinacat", 30)
    gameFiveText.x = gameFive.x
    gameFiveText.y = gameFive.y + 115
    gameFiveText:setTextColor(0,0,0)

    local gameSixText = display.newText("Tracing", 0, 0, "Chinacat", 30)
    gameSixText.x = gameSix.x
    gameSixText.y = gameSix.y + 115
    gameSixText:setTextColor(0,0,0)

    local gameSevenText = display.newText("Alphabets", 0, 0, "Chinacat", 30)
    gameSevenText.x = gameSeven.x
    gameSevenText.y = gameSeven.y + 115
    gameSevenText:setTextColor(0,0,0)
   --END INSERT TEXT

   --GO TO SCENE
    local function goToGameFive()
        storyboard.gotoScene( "balloonGame", "fade", 400 )
    end

    local function goToGameOne()
        storyboard.gotoScene( "colorMatching", "fade", 400 ) 
    end

    gameFive:addEventListener("tap", goToGameFive)
    gameOne:addEventListener("tap", goToGameOne)
    --END OF GO TO SCENE


    local prevButton = widget.newButton
    {
        defaultFile = "images/backButton.png",
        overFile = "images/backButtonOver.png",
        onRelease = function()
            storyboard.gotoScene( "menu", "flip", 400 )
        end,
    }
    prevButton.x = display.contentWidth * 0.99
    prevButton.y = display.contentHeight * 0.7
    prevButton:scale(1.2,1.2) 

    local prevButtonText = display.newText("RETURN TO MENU", 0, 0, "Chinacat", 40)
    prevButtonText.x = prevButton.x
    prevButtonText.y = prevButton.y + 90
    prevButtonText:setTextColor(0,0,0)

    screenGroup:insert(background)
    screenGroup:insert(gameOne)
    screenGroup:insert(gameTwo)
    screenGroup:insert(gameThree)
    screenGroup:insert(gameFour)
    screenGroup:insert(gameFive)
    screenGroup:insert(gameSix)
    screenGroup:insert(gameSeven)
    screenGroup:insert(prevButton)
    screenGroup:insert(gameOneText)
    screenGroup:insert(gameTwoText)
    screenGroup:insert(gameThreeText)
    screenGroup:insert(gameFourText)
    screenGroup:insert(gameFiveText)
    screenGroup:insert(gameSixText)
    screenGroup:insert(gameSevenText)
    screenGroup:insert(prevButtonText)
    
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

