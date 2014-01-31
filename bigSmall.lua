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

    local big
    local animal = {}
    local option1, option2, right, wrong

    local purpleDone = false
    local blueDone = false
    local redDone = false
    local orangeDone = false
    local yellowDone = false
    local greenDone = false
    local blackDone = false
    local brownDone = false

    local counter = 0

    local bg = display.newImageRect("images/9.jpg", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)

    restartButton = widget.newButton
    {
        defaultFile = "buttons/replay.png",
        overFile = "buttons/replayOver.png",
        onRelease = restartGame,
    }
    restartButton.x = display.contentWidth * 0.5
    restartButton.y = display.contentHeight * 0.4
    restartButton:scale(2.5,2.5)
    restartButton.alpha = 0
    screenGroup:insert(restartButton)

    exitButton = widget.newButton
    {
        defaultFile = "buttons/menu.png",
        overFile = "buttons/menuOver.png",
        onRelease = goToMenu,
    }
    exitButton.x = display.contentWidth * 0.5
    exitButton.y = display.contentHeight * 0.6
    exitButton:scale(2.5,2.5)
    exitButton.alpha = 0
    screenGroup:insert(exitButton)

    local instruction = display.newText("", 0, 0, native.systemFont, 100)
    instruction.x = W * 0.5
    instruction.y = H * 0.15
    instruction:setTextColor(0,0,0)

    --WIDGETS
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
        if counter~=8 then           
            if option1 ~= nil then
                option1:removeSelf()
                option2:removeSelf()
            end
            
            if big==1 then
                verdict.alpha = 0 
                if colorName == "purple" then
                    option1 = display.newImage("images/colors/pop1.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(1))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "blue" then
                    option1 = display.newImage("images/colors/pop2.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(2))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "red" then
                    option1 = display.newImage("images/colors/pop3.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(3))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "green" then
                    option1 = display.newImage("images/colors/pop4.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(4))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "orange" then
                    option1 = display.newImage("images/colors/pop5.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(5))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "yellow" then
                    option1 = display.newImage("images/colors/pop6.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(6))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "black" then
                    option1 = display.newImage("images/colors/pop7.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(7))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "brown" then
                    option1 = display.newImage("images/colors/pop8.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1

                end
            else
                if colorName == "purple" then
                    option1 = display.newImage("images/colors/pop1.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(1))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "blue" then
                    option1 = display.newImage("images/colors/pop2.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(2))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "red" then
                    option1 = display.newImage("images/colors/pop3.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(3))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "green" then
                    option1 = display.newImage("images/colors/pop4.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(4))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "orange" then
                    option1 = display.newImage("images/colors/pop5.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(5))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "yellow" then
                    option1 = display.newImage("images/colors/pop6.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(6))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "black" then
                    option1 = display.newImage("images/colors/pop7.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5;  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(7))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "brown" then
                    option1 = display.newImage("images/colors/pop8.png")
                    option1:scale(2.3,3)
                    option1.x = W * 0.5 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.5 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                end
            end
        else
            instruction.alpha = 0
            option1:removeSelf()                
            option2:removeSelf()
            nextButton.alpha = 0
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
        end
    end

    local function goHere() --location
        local rand1 = math.random(1,2)

        if rand1 == 1 then
            transition.to(option1, {x = W * 0.3, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.5, y = H * 0.5, time = 500})
        elseif rand1 == 2 then
            transition.to(option1, {x = W * 0.5, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.3, y = H * 0.5, time = 500})
        end
    end

    local function instructionFunction()
        verdict.alpha = 0
        local r = math.random(1,2)
        if r == 1 then
            instruction.text = "Tap the BIG animal"
            big = 1
        else
            instruction.text = "Tap the SMALL animal"
            big = 0
        end
    end
	
    local function nextAnimal()
        chooseAnimal()
    end

    function chooseAnimal()
        local rand = math.random(1,8)
        if counter~=8 then
            if rand == 1 then
                if purpleDone == false then
                    purpleDone = true
                    colorName = "purple"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 2 then
                if blueDone == false then
                    blueDone = true
                    colorName = "blue"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 3 then
                if redDone == false then
                    redDone = true
                    colorName = "red"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 4 then
                if greenDone == false then
                    greenDone = true
                    colorName = "green"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 5 then
                if orangeDone == false then
                    orangeDone = true
                    colorName = "orange"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 6 then
                if yellowDone == false then
                    yellowDone = true
                    colorName = "yellow"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 7 then
                if blackDone == false then
                    blackDone = true
                    colorName = "black"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 8 then
                if brownDone == false then
                    brownDone = true
                    colorName = "brown"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            end
        else
            option2:removeSelf()
            option1:removeSelf()
            instruction.alpha=0
            nextButton.alpha = 0
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
            
        end
    end

    local function startGame()
        transition.to(nextButton, {alpha = 1, time = 200})
        transition.to(startButton, {alpha = 0, time = 200})
        chooseAnimal()
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
    end

    function wrong()
        verdict.text = "Wrong"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
    end

    startButton:addEventListener("tap", startGame)
    nextButton:addEventListener("tap", chooseAnimal)
    restartButton:addEventListener("tap", restartGame)
    exitButton:addEventListener("tap", exitGame)
end

function scene:exitScene( event )
    external.setPreviousScene("bigSmall")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

