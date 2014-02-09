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
    local numberName = ""

    local showColors, option1, option2, option3, right, wrong
    local startButton, startGame, nextButton, restartButton

    local oneDone = false
    local twoDone = false
    local threeDone = false
    local fourDone = false
    local fiveDone = false
    local sixDone = false
    local sevenDone = false
    local eightDone = false
    local nineDone = false
    local tenDone = false


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
            return "images/numbers/partial/button1.png" 
        elseif num == 2 then
            return "images/numbers/partial/button2.png" 
        elseif num == 3 then
            return "images/numbers/partial/button3.png" 
        elseif num == 4 then
            return "images/numbers/partial/button4.png" 
        elseif num == 5 then
            return "images/numbers/partial/button5.png" 
        elseif num == 6 then
            return "images/numbers/partial/button6.png" 
        elseif num == 7 then
            return "images/numbers/partial/button7.png"
        elseif num == 8 then
            return "images/numbers/partial/button8.png" 
        elseif num == 9 then
            return "images/numbers/partial/button9.png" 
        elseif num == 10 then
            return "images/numbers/partial/button10.png" 
        end
    end

    local function createOptions()
        if colorCount ~= 10 then
            local r = 0
            local r2 = 0
            
            if option1 ~= nil then
                option1:removeSelf()
                option2:removeSelf()
                option3:removeSelf()
            end
            
            if numberName == "one" then
                currentNum = 1
                option1 = display.newImage("images/numbers/partial/button1.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "two" then
                currentNum = 2
                option1 = display.newImage("images/numbers/partial/button2.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "three" then
                currentNum = 3
                option1 = display.newImage("images/numbers/partial/button3.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "four" then
                currentNum = 4
                option1 = display.newImage("images/numbers/partial/button4.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "five" then
                currentNum = 5
                option1 = display.newImage("images/numbers/partial/button5.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "six" then
                numberName = 6
                option1 = display.newImage("images/numbers/partial/button6.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "seven" then
                currentNum = 7
                option1 = display.newImage("images/numbers/partial/button7.png")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "eight" then
                currentNum = 8
                option1 = display.newImage("images/numbers/partial/button8.png")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "nine" then
                currentNum = 9
                option1 = display.newImage("images/numbers/partial/button9.png")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif numberName == "ten" then
                currentNum = 10
                option1 = display.newImage("images/numbers/partial/button10.png")
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
            if numberName ~= "" then
                color[colorCount-1]:removeSelf()
            end

            color[colorCount] = display.newImage(value)
            color[colorCount]:scale(0.9,0.9)
            color[colorCount].x = W * 0.35
            color[colorCount].y = H * 0.5
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
            transition.to(option1, {x = W * 0.55, y = H * 0.25, time = 500})
            transition.to(option2, {x = W * 0.55, y = H * 0.5, time = 500})
            transition.to(option3, {x = W * 0.55, y = H * 0.75, time = 500})
        elseif rand1 ==2 then
            transition.to(option1, {x = W * 0.55, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.55, y = H * 0.25, time = 500})
            transition.to(option3, {x = W * 0.55, y = H * 0.75, time = 500})
        elseif rand1 == 3 then
            transition.to(option1, {x = W * 0.55, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.55, y = H * 0.75, time = 500})
            transition.to(option3, {x = W * 0.55, y = H * 0.25, time = 500})
        end
    end
    
    local function nextColor()
        showColors()
    end

    function showColors() 
        local rand = math.random(1,10)
        
        transition.to(nextButton, {alpha = 0, time = 200})
        
        if rand == 1 then
            if oneDone == false then
                oneDone = true
                prepareColor("images/numbers/partial/1.png")
                numberName = "one"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 2 then
            if twoDone == false then
                twoDone = true
                prepareColor("images/numbers/partial/2.png")
                numberName = "two"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 3 then
            if threeDone == false then
                threeDone = true
                prepareColor("images/numbers/partial/3.png")
                numberName = "three"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 4 then
            if fourDone == false then
                fourDone = true
                prepareColor("images/numbers/partial/4.png")
                numberName = "four"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 5 then
            if fiveDone == false then
                fiveDone = true
                prepareColor("images/numbers/partial/5.png")
                numberName = "five"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 6 then
            if sixDone == false then
                sixDone = true
                prepareColor("images/numbers/partial/6.png")
                numberName = "six"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 7 then
            if sevenDone == false then
                sevenDone = true
                prepareColor("images/numbers/partial/7.png")
                numberName = "seven"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 8 then
            if eightDone == false then
                eightDone = true
                prepareColor("images/numbers/partial/8.png")
                numberName = "eight"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 9 then
            if nineDone == false then
                nineDone = true
                prepareColor("images/numbers/partial/9.png")
                numberName = "nine"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 10 then
            if tenDone == false then
                tenDone = true
                prepareColor("images/numbers/partial/10.png")
                numberName = "ten"
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
        storyboard.gotoScene("refresh_countingNumGame", "fade", 300)
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
        external.correctionEffects("wrong")
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
    external.setPreviousScene("countingNumGame")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

