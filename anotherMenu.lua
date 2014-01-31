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

    local background = display.newImageRect("images/anotherBG_1.png", display.contentWidth, display.contentHeight)
    background.x = display.contentWidth * 0.5
    background.y = display.contentHeight * 0.5

    --INSERT BUTTONS

    local gameOne = widget.newButton
    {
        defaultFile = "buttons2/colorMatch.png",
        overFile = "buttons2/colorMatchHover.png",
        onRelease = function()
            storyboard.gotoScene( "colorMatching", "fade", 400 )
        end,
    }
    gameOne.x = display.contentWidth * 0.25
    gameOne.y = display.contentHeight * 0.22
    gameOne:scale(2,2)


    local gameTwo = widget.newButton
    {
        defaultFile = "buttons2/bigSmall.png",
        overFile = "buttons2/bigSmallHover.png",
        onRelease = function()
            storyboard.gotoScene( "bigSmall", "fade", 400 )
        end,
    }
    gameTwo.x = display.contentWidth * 0.5
    gameTwo.y = display.contentHeight * 0.22
    gameTwo:scale(2,2)


    local gameThree = widget.newButton
    {
        defaultFile = "buttons2/identifyShapes.png",
        overFile = "buttons2/identifyShapesHover.png",
        onRelease = function()
            storyboard.gotoScene( "menuStoryMode", "fade", 400 )
        end,
    }
    gameThree.x = display.contentWidth * 0.75
    gameThree.y = display.contentHeight * 0.22
    gameThree:scale(2,2)


    local gameFour = widget.newButton
    {
        defaultFile = "buttons2/number.png",
        overFile = "buttons2/numberHover.png",
        onRelease = function()
            storyboard.gotoScene( "menuStoryMode", "fade", 400 )
        end,
    }
    gameFour.x = display.contentWidth * 0.25
    gameFour.y = display.contentHeight * 0.47
    gameFour:scale(2,2)


    local gameFive = widget.newButton
    {
        defaultFile = "buttons2/balloonPop.png",
        overFile = "buttons2/balloonPopHover.png",
        onRelease = function()
            storyboard.gotoScene( "balloonGame", "fade", 400 )
        end,
    }
    gameFive.x = display.contentWidth * 0.5
    gameFive.y = display.contentHeight * 0.47
    gameFive:scale(2,2)


    local gameSix = widget.newButton
    {
        defaultFile = "buttons2/targetAlphabet.png",
        overFile = "buttons2/targetAlphabetHover.png",
        onRelease = function()
            storyboard.gotoScene( "menuStoryMode", "fade", 400 )
        end,
    }
    gameSix.x = display.contentWidth * 0.75
    gameSix.y = display.contentHeight * 0.47
    gameSix:scale(2,2)


    local gameSeven = widget.newButton
    {
        defaultFile = "buttons2/mixColors.png",
        overFile = "buttons2/mixColorsHover.png",
        onRelease = function()
            storyboard.gotoScene( "menuStoryMode", "fade", 400 )
        end,
    }
    gameSeven.x = display.contentWidth * 0.5
    gameSeven.y = display.contentHeight * 0.72
    gameSeven:scale(2,2)



    --END INSERT BUTTONS

    --INSERT TEST FOR BUTTONS
    local gameOneText = display.newText("Color Matching", 0, 0, "Chinacat", 25)
    gameOneText.x = gameOne.x
    gameOneText.y = gameOne.y + 80
    gameOneText:setTextColor(1,1,1)
   
    local gameTwoText = display.newText("Identify Sizes", 0, 0, "Chinacat", 25)
    gameTwoText.x = gameTwo.x
    gameTwoText.y = gameTwo.y + 80
    gameTwoText:setTextColor(1,1,1)

    local gameThreeText = display.newText("Identify Shapes", 0, 0, "Chinacat", 25)
    gameThreeText.x = gameThree.x
    gameThreeText.y = gameThree.y + 80
    gameThreeText:setTextColor(1,1,1)

    local gameFourText = display.newText("Counting Numbers", 0, 0, "Chinacat", 25)
    gameFourText.x = gameFour.x
    gameFourText.y = gameFour.y + 80
    gameFourText:setTextColor(1,1,1)

    local gameFiveText = display.newText("Pop Balloons", 0, 0, "Chinacat", 25)
    gameFiveText.x = gameFive.x
    gameFiveText.y = gameFive.y + 80
    gameFiveText:setTextColor(1,1,1)

    local gameSixText = display.newText("Alphabet Target", 0, 0, "Chinacat", 25)
    gameSixText.x = gameSix.x
    gameSixText.y = gameSix.y + 80
    gameSixText:setTextColor(1,1,1)

    local gameSevenText = display.newText("Mixing Colors", 0, 0, "Chinacat", 25)
    gameSevenText.x = gameSeven.x
    gameSevenText.y = gameSeven.y + 80
    gameSevenText:setTextColor(1,1,1)
   --END INSERT TEXT

   --GO TO SCENE
    local function goToGameFive()
        storyboard.gotoScene( "balloonGame", "fade", 400 )
    end

    local function goToGameOne()
        storyboard.gotoScene( "colorMatching", "fade", 400 ) 
    end

    local function goToGameTwo()
        storyboard.gotoScene( "bigSmall", "fade", 400 ) 
    end
    gameTwo:addEventListener("tap", goToGameTwo)
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
    prevButton.x = display.contentWidth * 0.92
    prevButton.y = display.contentHeight * 0.78
    prevButton:scale(1.2,1.2) 

    local prevButtonText = display.newText("MENU", 0, 0, "Chinacat", 25)
    prevButtonText.x = prevButton.x
    prevButtonText.y = prevButton.y + 57
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

