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

    local W = display.contentWidth
    local H = display.contentHeight

    local color = {}
    local colorCount = 0
    local colorName = ""

    local showColors, option1, option2, option3, right, wrong
    local startButton, startGame, nextButton, restartButton

    local purpleDone = false
    local blueDone = false
    local redDone = false
    local orangeDone = false
    local yellowDone = false
    local greenDone = false
    local blackDone = false
    local brownDone = false
    local whiteDone = false
    local pinkDone = false


    local answer
    local currentNum = 0
    local colorNum = 0
    local scoreNum = 0

    local bg = display.newImageRect("images/9_2.jpg", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)
    

    local colorNumText = display.newText("Color # "..colorNum, 0, 0, "Chinacat", 50)
    colorNumText.x = W * 0.845
    colorNumText.y = H * 0.15
    screenGroup:insert(colorNumText)
    
    local scoreText = display.newText("Score: "..scoreNum, 0, 0, "Chinacat", 45)
    scoreText.x = W * 0.85
    scoreText.y = H * 0.3
    screenGroup:insert(scoreText)
    
    local verdict = display.newText("", 0, 0, "Chinacat", 80)
    verdict:setFillColor(0,0,0)
    verdict.x = W * 0.35; verdict.y = H * 0.4
    screenGroup:insert(verdict)

    local function chooseOptionColor(num)
        if num == 1 then
            return "images/colorMatchGame/purplesmall.png" -- purple
        elseif num == 2 then
            return "images/colorMatchGame/bluesmall.png" -- blue
        elseif num == 3 then
            return "images/colorMatchGame/redsmall.png" -- red
        elseif num == 4 then
            return "images/colorMatchGame/greensmall.png" -- green
        elseif num == 5 then
            return "images/colorMatchGame/orangesmall.png" -- orange
        elseif num == 6 then
            return "images/colorMatchGame/yellowsmall.png" -- yellow
        elseif num == 7 then
            return "images/colorMatchGame/blacksmall.png" -- black
        elseif num == 8 then
            return "images/colorMatchGame/brownsmall.png" -- brown
        elseif num == 9 then
            return "images/colorMatchGame/whitesmall.png" -- white
        elseif num == 10 then
            return "images/colorMatchGame/pinksmall.png" -- pink
        end
    end

    local function createOptions()
        if colorCount ~= 9 then
            local r = 0
            local r2 = 0
            
            if option1 ~= nil then
                option1:removeSelf()
                option2:removeSelf()
                option3:removeSelf()
            end
            
            if colorName == "purple" then
                currentNum = 1
                option1 = display.newImage("images/colorMatchGame/purplesmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "blue" then
                currentNum = 2
                option1 = display.newImage("images/colorMatchGame/bluesmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "red" then
                currentNum = 3
                option1 = display.newImage("images/colorMatchGame/redsmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "green" then
                currentNum = 4
                option1 = display.newImage("images/colorMatchGame/greensmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "orange" then
                currentNum = 5
                option1 = display.newImage("images/colorMatchGame/orangesmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "yellow" then
                currentNum = 6
                option1 = display.newImage("images/colorMatchGame/yellowsmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "black" then
                currentNum = 7
                option1 = display.newImage("images/colorMatchGame/blacksmall.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "brown" then
                currentNum = 8
                option1 = display.newImage("images/colorMatchGame/brownsmall.png")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "white" then
                currentNum = 9
                option1 = display.newImage("images/colorMatchGame/whitesmall.png")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "pink" then
                currentNum = 10
                option1 = display.newImage("images/colorMatchGame/pinksmall.png")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            end
            
            local check1 = true
            local check2 = true

            while check1 do
                r = math.random(1,10)
                if r~=currentNum then
                    option2 = display.newImage(chooseOptionColor(r))
                    option2.x = W * 0.35 option2.y = H * 0.4
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    check1 = false
                end
            end

            while check2 do
                r2 = math.random(1,10)
                if r2~=r and r2~=currentNum then
                    option3 = display.newImage(chooseOptionColor(r2))
                    option3.x = W * 0.35 option3.y = H * 0.4
                    option3:addEventListener("tap", wrong)
                    screenGroup:insert(option3)
                    check2 = false
                end
            end

            -- option1.x = W * 0.5
            -- option1.y = H * 0.25
            -- option2.x = W * 0.5
            -- option2.y = H * 0.25
            -- option3.x = W * 0.5
            -- option3.y = H * 0.25
            else
            
            
                color[colorCount-1]:removeSelf()
                option1:removeSelf()
                option2:removeSelf()
                option3:removeSelf()
                nextButton.alpha = 0
                restartButton.alpha = 1
                exitButton.alpha = 1
                verdict.alpha = 0
        end
        
    end

    local function prepareColor(value)
        if colorCount ~= 10 then

            verdict.alpha = 0
            if colorName ~= "" then
                color[colorCount-1]:removeSelf()
            end

            color[colorCount] = display.newImage(value)
            color[colorCount]:scale(0.9,0.9)
            color[colorCount].x = W * 0.35
            color[colorCount].y = H * 0.35
            screenGroup:insert(color[colorCount])
            colorCount = colorCount + 1
        else
            color[colorCount-1]:removeSelf()
            option1:removeSelf()
            option2:removeSelf()
            option3:removeSelf()
            nextButton.alpha = 0
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
        end
    end

    local function goHere() --location
        local rand1 = math.random(1,3)

        if rand1 == 1 then
            transition.to(option1, {x = W * 0.16, y = H * 0.71, time = 500})
            transition.to(option2, {x = W * 0.36, y = H * 0.71, time = 500})
            transition.to(option3, {x = W * 0.56, y = H * 0.71, time = 500})
        elseif rand1 ==2 then
            transition.to(option1, {x = W * 0.36, y = H * 0.71, time = 500})
            transition.to(option2, {x = W * 0.16, y = H * 0.71, time = 500})
            transition.to(option3, {x = W * 0.56, y = H * 0.71, time = 500})
        elseif rand1 == 3 then
            transition.to(option1, {x = W * 0.36, y = H * 0.71, time = 500})
            transition.to(option2, {x = W * 0.56, y = H * 0.71, time = 500})
            transition.to(option3, {x = W * 0.16, y = H * 0.71, time = 500})
        end
    end
    
    local function nextColor()
        showColors()
    end

    function showColors() 
        local rand = math.random(1,10)
        
        transition.to(nextButton, {alpha = 0, time = 200})
        
        if rand == 1 then
            if purpleDone == false then
                purpleDone = true
                prepareColor("images/colorMatchGame/purple.png")
                colorName = "purple"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 2 then
            if blueDone == false then
                blueDone = true
                prepareColor("images/colorMatchGame/blue.png")
                colorName = "blue"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 3 then
            if redDone == false then
                redDone = true
                prepareColor("images/colorMatchGame/red.png")
                colorName = "red"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 4 then
            if greenDone == false then
                greenDone = true
                prepareColor("images/colorMatchGame/green.png")
                colorName = "green"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 5 then
            if orangeDone == false then
                orangeDone = true
                prepareColor("images/colorMatchGame/orange.png")
                colorName = "orange"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 6 then
            if yellowDone == false then
                yellowDone = true
                prepareColor("images/colorMatchGame/yellow.png")
                colorName = "yellow"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 7 then
            if blackDone == false then
                blackDone = true
                prepareColor("images/colorMatchGame/black.png")
                colorName = "black"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 8 then
            if brownDone == false then
                brownDone = true
                prepareColor("images/colorMatchGame/brown.png")
                colorName = "brown"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 9 then
            if whiteDone == false then
                whiteDone = true
                prepareColor("images/colorMatchGame/white.png")
                colorName = "white"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 10 then
            if pinkDone == false then
                pinkDone = true
                prepareColor("images/colorMatchGame/pink.png")
                colorName = "pink"
                createOptions()
                goHere()
            else
                nextColor()
            end
        end
    end

    function startGame()
        transition.to(exitButton, {alpha = 1, time = 200})
        transition.to(restartButton, {alpha = 1, time = 200})
        transition.to(startButton, {alpha = 0, time = 200})
        showColors()
    end

    local function exitGame()
        storyboard.gotoScene("anotherMenu", "fade", 400)
    end

    local function restartGame()
        storyboard.gotoScene("refresh_colormatching", "fade", 300)
    end

    function right()
        verdict.text = "Correct"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
        scoreNum = scoreNum + 1
        scoreText.text = "Score: "..scoreNum
        external.correctionEffects("correct")
        transition.to(nextButton, {alpha = 1, time = 200})
    end

    function wrong()
        verdict.text = "Wrong"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
        external.correctionEffects("worng")
        transition.to(nextButton, {alpha = 1, time = 200})
    end
    
    --WIDGETS
    restartButton = widget.newButton
    {
        defaultFile = "images/buttons/restart2.png",
        overFile = "images/buttons/restart2Over.png",
        onRelease = restartGame,
    }
    restartButton.x = display.contentWidth * 0.835
    restartButton.y = display.contentHeight * 0.7
    restartButton:scale(2,2)
    restartButton.alpha = 0
    screenGroup:insert(restartButton)

    exitButton = widget.newButton
    {
        defaultFile = "images/buttons/menu2.png",
        overFile = "images/buttons/menu2Over.png",
        onRelease = exitGame,
    }
    exitButton.x = display.contentWidth * 0.835
    exitButton.y = display.contentHeight * 0.85
    exitButton:scale(2,2)
    exitButton.alpha = 0
    screenGroup:insert(exitButton)

    nextButton = widget.newButton
    {
        defaultFile = "images/buttons/next2.png",
        overFile = "images/buttons/next2Over.png",
        onRelease = function()
            colorNum = colorNum + 1
            colorNumText.text = "Color # "..colorNum
            showColors()
        end,
    }
    nextButton.x = verdict.x
    nextButton.y = H * 0.7
    nextButton:scale(2,2)
    nextButton.alpha = 0
    screenGroup:insert(nextButton)

    startButton = widget.newButton
    {
        defaultFile = "images/buttons/start.png",
        overFile = "images/buttons/startOver.png",
        onRelease = startGame,
    }
    startButton.x = W * 0.5
    startButton.y = H * 0.7
    startButton:scale(2.5,2.5)
    screenGroup:insert(startButton)

    restartButton:addEventListener("tap", restartGame)
    exitButton:addEventListener("tap", exitGame)
end

function scene:exitScene( event )
    external.setPreviousScene("colorMatching")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

