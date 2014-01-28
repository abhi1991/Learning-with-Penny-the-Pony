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

    local purpleDone = false
    local blueDone = false
    local redDone = false
    local orangeDone = false
    local yellowDone = false
    local greenDone = false
    local blackDone = false
    local brownDone = false

    local answer
    local currentNum = 0
    local storeNum = 0

    local bg = display.newImageRect("images/9.jpg", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)

    local restartButton = display.newText("Restart", 0, 0, "Chinacat", 60)
    restartButton.x = W * 0.5
    restartButton.y = H * 0.35
    restartButton.alpha = 0
    screenGroup:insert(restartButton)

    local exitButton = display.newText("Exit", 0, 0, "Chinacat", 60)
    exitButton.x = W * 0.5
    exitButton.y = H * 0.55
    exitButton.alpha = 0
    screenGroup:insert(exitButton)

    local nextButton = display.newText("Next", 0, 0, "Chinacat", 40)
    nextButton.x = W * 0.5
    nextButton.y = H * 0.8
    nextButton.alpha = 0
    screenGroup:insert(nextButton)

    local startButton = display.newText("Start", 0, 0, "Chinacat", 70)
    startButton.x = W * 0.5
    startButton.y = H * 0.5
    screenGroup:insert(startButton)

    local verdict = display.newText("", 0, 0, "Chinacat", 70)
    verdict.x = W * 0.5; verdict.y = H * 0.4

    local function chooseOptionColor(num)
        if num == 1 then
            return "images/colors/pop1.png"
        elseif num == 2 then
            return "images/colors/pop2.png"
        elseif num == 3 then
            return "images/colors/pop3.png"
        elseif num == 4 then
            return "images/colors/pop4.png"
        elseif num == 5 then
            return "images/colors/pop5.png"
        elseif num == 6 then
            return "images/colors/pop6.png"
        elseif num == 7 then
            return "images/colors/pop7.png"
        elseif num == 8 then
            return "images/colors/pop8.png"
        end
    end

    local function createOptions()
        if colorCount ~= 8 then
            local r = math.random(1,8)
            local r2 = math.random(1,8)
            local r3 = math.random(1,8)

            if option1 ~= nil then
                option1:removeSelf()
                option2:removeSelf()
                option3:removeSelf()
            end
            
            if colorName == "purple" then
                currentNum = 1
                option1 = display.newImage("images/colors/pop1.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "blue" then
                currentNum = 2
                option1 = display.newImage("images/colors/pop2.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "red" then
                currentNum = 3
                option1 = display.newImage("images/colors/pop3.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "green" then
                currentNum = 4
                option1 = display.newImage("images/colors/pop4.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "orange" then
                currentNum = 5
                option1 = display.newImage("images/colors/pop5.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "yellow" then
                currentNum = 6
                option1 = display.newImage("images/colors/pop6.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "black" then
                currentNum = 7
                option1 = display.newImage("images/colors/pop7.png")
                option1.x = W * 0.5;  option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            elseif colorName == "brown" then
                currentNum = 8
                option1 = display.newImage("images/colors/pop8.png")
                option1.x = W * 0.5 option1.y = H * 0.25
                option1:addEventListener("tap", right)
                screenGroup:insert(option1)
            end

            if r ~= currentNum then
                option2 = display.newImage(chooseOptionColor(r))
                option2.x = W * 0.5 option2.y = H * 0.25
                option2:addEventListener("tap", wrong)
                screenGroup:insert(option2)
            else
                storeNum = r
                option2 = display.newImage(chooseOptionColor(r3))
                option2.x = W * 0.5 option2.y = H * 0.25
                option2:addEventListener("tap", wrong)
                screenGroup:insert(option2)
            end

            if r2 == currentNum and currentNum == storeNum then
                if r2 ~= 8 then
                    option3 = display.newImage(chooseOptionColor(r2 + 1))
                    option3.x = W * 0.5 option3.y = H * 0.25
                    option3:addEventListener("tap", wrong)
                    screenGroup:insert(option3)
                else
                    option3 = display.newImage(chooseOptionColor(r2 - 1))
                    option3.x = W * 0.5 option3.y = H * 0.25
                    option3:addEventListener("tap", wrong)
                    screenGroup:insert(option3)
                end
            else
                option3 = display.newImage(chooseOptionColor(r2))
                option3.x = W * 0.5 option3.y = H * 0.25
                option3:addEventListener("tap", wrong)
                screenGroup:insert(option3)
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
        if colorCount ~= 8 then

            verdict.alpha = 0
            if colorName ~= "" then
                color[colorCount-1]:removeSelf()
            end

            color[colorCount] = display.newImage(value)
            color[colorCount]:scale(2.5,3)
            color[colorCount].x = W * 0.5
            color[colorCount].y = H * 0.25
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

    local function goHere()
        local rand1 = math.random(1,3)

        if rand1 == 1 then
            transition.to(option1, {x = W * 0.3, y = H * 0.6, time = 500})
            transition.to(option2, {x = W * 0.5, y = H * 0.6, time = 500})
            transition.to(option3, {x = W * 0.7, y = H * 0.6, time = 500})
        elseif rand1 ==2 then
            transition.to(option1, {x = W * 0.5, y = H * 0.6, time = 500})
            transition.to(option2, {x = W * 0.3, y = H * 0.6, time = 500})
            transition.to(option3, {x = W * 0.7, y = H * 0.6, time = 500})
        elseif rand1 == 3 then
            transition.to(option1, {x = W * 0.5, y = H * 0.6, time = 500})
            transition.to(option2, {x = W * 0.7, y = H * 0.6, time = 500})
            transition.to(option3, {x = W * 0.3, y = H * 0.6, time = 500})
        end
    end

    local function nextColor()
        showColors()
    end

    function showColors()
        local rand = math.random(1,8)

        if rand == 1 then
            if purpleDone == false then
                purpleDone = true
                prepareColor("images/colors/pop1.png")
                colorName = "purple"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 2 then
            if blueDone == false then
                blueDone = true
                prepareColor("images/colors/pop2.png")
                colorName = "blue"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 3 then
            if redDone == false then
                redDone = true
                prepareColor("images/colors/pop3.png")
                colorName = "red"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 4 then
            if greenDone == false then
                greenDone = true
                prepareColor("images/colors/pop4.png")
                colorName = "green"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 5 then
            if orangeDone == false then
                orangeDone = true
                prepareColor("images/colors/pop5.png")
                colorName = "orange"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 6 then
            if yellowDone == false then
                yellowDone = true
                prepareColor("images/colors/pop6.png")
                colorName = "yellow"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 7 then
            if blackDone == false then
                blackDone = true
                prepareColor("images/colors/pop7.png")
                colorName = "black"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 8 then
            if brownDone == false then
                brownDone = true
                prepareColor("images/colors/pop8.png")
                colorName = "brown"
                createOptions()
                goHere()
            else
                nextColor()
            end
        end
    end

    local function startGame()
        transition.to(nextButton, {alpha = 1, time = 200})
        transition.to(startButton, {alpha = 0, time = 200})
        showColors()
    end

    local function exitGame()
        storyboard.gotoScene("anotherMenu", "fade", 400)
    end

    local function restartGame()
        storyboard.gotoScene("refresh", "fade", 300)
    end

    function right()
        verdict.text = "Correct"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
    end

    function wrong()
        verdict.text = "Wrong"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
    end

    startButton:addEventListener("tap", startGame)
    nextButton:addEventListener("tap", showColors)
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

