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

        
    local beeDone = false
    local bunnyDone = false
    local catDOne = false
    local chickenDone = false
    local cowDone = false
    local dogDone = false
    local duckDone = false
    local elephantDone = false
    local horseDone = false
    local pigDOne = false
    local sheepDone = false
    local turkeyDone = false

    local counter = 0

    local bg = display.newImageRect("images/bgOption.jpg", W, H)
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

   

    --WIDGETS
    local nextButton = display.newText("Next", 0, 0, "Chinacat", 60)
    nextButton.x = W * 0.5
    nextButton.y = H * 0.1
    nextButton.alpha = 0
    screenGroup:insert(nextButton)

    local startButton = display.newText("Start", 0, 0, "Chinacat", 70)
    startButton.x = W * 0.5
    startButton.y = H * 0.5
    screenGroup:insert(startButton)

    local verdict = display.newText("", 0, 0, "Chinacat", 60)
    verdict.x = W * 0.5; verdict.y = H * 0.8
 
    local instruction = display.newText("", 0, 0, "Chinacat", 70)
    instruction.x = W * 0.5
    instruction.y = H * 0.9
    instruction:setTextColor(0,0,0)

    local function chooseOptionColor(num)
        if num == 1 then
            return "images/animals/beeSmall.png"
        elseif num == 2 then
            return "images/animals/bunnySmall.png"
        elseif num == 3 then
            return "images/animals/catSmall.png"
        elseif num == 4 then
            return "images/animals/chickenSmall.png"
        elseif num == 5 then
            return "images/animals/cowSmall.png"
        elseif num == 6 then
            return "images/animals/dogSmall.png"
        elseif num == 7 then
            return "images/animals/duckSmall.png"
        elseif num == 8 then
            return "images/animals/elephantSmall.png"
        elseif num == 9 then
            return "images/animals/horseSmall.png"
        elseif num == 10 then
            return "images/animals/pigSmall.png"
        elseif num == 11 then
            return "images/animals/sheepSmall.png"
        elseif num == 12 then
            return "images/animals/turkeySmall.png"
        end
    end

    local function createOptions()
        if counter~=12 then           
            if option1 ~= nil then
                option1:removeSelf()
                option2:removeSelf()
            end
            
            if big==1 then
                verdict.alpha = 0 
                if colorName == "bee" then
                    option1 = display.newImage("images/animals/beeSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(1))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "bunny" then
                    option1 = display.newImage("images/animals/bunnySmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(2))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "cat" then
                    option1 = display.newImage("images/animals/catSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(3))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "chicken" then
                    option1 = display.newImage("images/animals/chickenSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(4))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "cow" then
                    option1 = display.newImage("images/animals/cowSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(5))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "dog" then
                    option1 = display.newImage("images/animals/dogSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(6))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "duck" then
                    option1 = display.newImage("images/animals/duckSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(7))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "elephant" then
                    option1 = display.newImage("images/animals/elephantSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "horse" then
                    option1 = display.newImage("images/animals/horseSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "pig" then
                    option1 = display.newImage("images/animals/pigSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "sheep" then
                    option1 = display.newImage("images/animals/sheepSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "turkey" then
                    option1 = display.newImage("images/animals/turkeySmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", right)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", wrong)
                    screenGroup:insert(option2)
                    counter= counter+1

                end
            else
                if colorName == "bee" then
                    option1 = display.newImage("images/animals/beeSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(1))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "bunny" then
                    option1 = display.newImage("images/animals/bunnySmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(2))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "cat" then
                    option1 = display.newImage("images/animals/catSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(3))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "chicken" then
                    option1 = display.newImage("images/animals/chickenSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(4))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "cow" then
                    option1 = display.newImage("images/animals/cowSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(5))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "dog" then
                    option1 = display.newImage("images/animals/dogSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(6))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "duck" then
                    option1 = display.newImage("images/animals/duckSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3  option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(7))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "elephant" then
                    option1 = display.newImage("images/animals/elephantSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "horse" then
                    option1 = display.newImage("images/animals/horseSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "pig" then
                    option1 = display.newImage("images/animals/pigSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "sheep" then
                    option1 = display.newImage("images/animals/sheepSmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
                    option2:addEventListener("tap", right)
                    screenGroup:insert(option2)
                    counter= counter+1
                elseif colorName == "turkey" then
                    option1 = display.newImage("images/animals/turkeySmall.png")
                    option1:scale(1.5,1.5)
                    option1.x = W * 0.3 option1.y = H * 0.25
                    option1:addEventListener("tap", wrong)
                    screenGroup:insert(option1)
                    option2 = display.newImage(chooseOptionColor(8))
                    option2.x = W * 0.65 option2.y = H * 0.25
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
            transition.to(option2, {x = W * 0.65, y = H * 0.5, time = 500})
        elseif rand1 == 2 then
            transition.to(option1, {x = W * 0.65, y = H * 0.5, time = 500})
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
        local rand = math.random(1,12)
        if counter~=12 then
            if rand == 1 then
                if beeDone == false then
                    beeDone = true
                    colorName = "bee"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 2 then
                if bunnyDone == false then
                    bunnyDone = true
                    colorName = "bunny"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 3 then
                if catDOne == false then
                    catDone = true
                    colorName = "cat"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 4 then
                if dogDone == false then
                    dogDone = true
                    colorName = "dog"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 5 then
                if chickenDone == false then
                    chickenDone = true
                    colorName = "chicken"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 6 then
                if cowDone == false then
                    cowDone = true
                    colorName = "cow"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 7 then
                if duckDone == false then
                    duckDone = true
                    colorName = "duck"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 8 then
                if elephantDone == false then
                    elephantDone = true
                    colorName = "elephant"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 9 then
                if horseDone == false then
                    horseDone = true
                    colorName = "horse"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 10 then
                if pigDOne == false then
                    pigDOne = true
                    colorName = "pig"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 11 then
                if sheepDone == false then
                    sheepDone = true
                    colorName = "sheep"
                    instructionFunction()
                    createOptions()
                    goHere()
                else
                    nextAnimal()
                end
            elseif rand == 12 then
                if turkeyDone == false then
                    turkeyDone = true
                    colorName = "turkey"
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
        storyboard.gotoScene("refresh_bigSmall", "fade", 300)
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

