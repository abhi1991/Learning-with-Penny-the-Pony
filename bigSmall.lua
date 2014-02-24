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
    local times = 0

        
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
    local colorName, exitButton, startButton, startGame, nextButton, restartButton

    local answer
    local currentNum = 0
    local colorNum = 0
    local scoreNum = 0


    local instr = display.newImage("images/instructions/identSizes.png")
        instr.x = display.contentWidth * 0.5
        instr.y = display.contentHeight * 0.5
    instr:scale(0.7,0.7)
        external.intruct("engSize")


    local bg = display.newImageRect("images/backgrounds/BG_bigSmall.png", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)

    local endMessage = display.newText("Game Over", 0, 0, "Chinacat", 60)
    endMessage.x = W * 0.4
    endMessage.y = H * 0.3
    endMessage:setTextColor(0,0,0)
    endMessage.alpha = 0
    screenGroup:insert(endMessage)

    local animalNumText = display.newText("Animal #: "..times, 0, 0, "Chinacat", 50)
    animalNumText.x = W * 0.845
    animalNumText.y = H * 0.15
    screenGroup:insert(animalNumText)
    
    local scoreText = display.newText("Score: "..scoreNum, 0, 0, "Chinacat", 45)
    scoreText.x = W * 0.85
    scoreText.y = H * 0.3
    screenGroup:insert(scoreText)

    local verdict = display.newText("", 0, 0, "Chinacat", 80)
    verdict.x = W * 0.4; verdict.y = H * 0.3
    screenGroup:insert(verdict)
 
    local instruction = display.newText("", 0, 0, "Chinacat", 70)
    instruction.x = W * 0.5
    instruction.y = H * 0.9
    instruction:setTextColor(0,0,0)
    screenGroup:insert(instruction)


    local function goToMenu()
        storyboard.gotoScene( "anotherMenu", "fade", 400 )
    end



    --WIDGETS
    restartButton = widget.newButton
    {
        defaultFile = "buttons/replay.png",
        overFile = "buttons/replayOver.png",
        onRelease = restartGame,
    }
    restartButton.x = display.contentWidth * 0.25
    restartButton.y = display.contentHeight * 0.55
    restartButton:scale(2,2)
    restartButton.alpha = 0
    screenGroup:insert(restartButton)

    exitButton = widget.newButton
    {
        defaultFile = "buttons/menu.png",
        overFile = "buttons/menuOver.png",
        onRelease = goToMenu,
    }
    exitButton.x = display.contentWidth * 0.55
    exitButton.y = display.contentHeight * 0.55
    exitButton:scale(2,2)
    exitButton.alpha = 0
    screenGroup:insert(exitButton)

    backMenuButton = widget.newButton
    {
        defaultFile = "buttons/mainmenu.png",
        overFile = "buttons/mainmenuOver.png",
        onRelease = goToMenu,
    }
    backMenuButton.x = display.contentWidth * 0.5
    backMenuButton.y = display.contentHeight * 0.55
    backMenuButton:scale(2,2)
    screenGroup:insert(backMenuButton)

    nextButton = widget.newButton
    {
        defaultFile = "images/buttons/next2.png",
        overFile = "images/buttons/next2Over.png",

    }
    nextButton.x = W * 0.85
    nextButton.y = H * 0.6
    nextButton:scale(2,2)
    nextButton.alpha = 0
    screenGroup:insert(nextButton)

    startButton = widget.newButton
    {
        defaultFile = "buttons/play1.png",
        overFile = "buttons/play1_1.png",
        onRelease = startGame,
    }
    startButton.x = W * 0.5
    startButton.y = H * 0.35
    startButton:scale(2.5,2.5)
    screenGroup:insert(startButton)

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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(9))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(10))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(11))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(12))
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(9))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(10))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(11))
                    option2:scale(1,1)
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
                    option2 = display.newImage(chooseOptionColor(12))
                    option2:scale(1,1)
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
            transition.to(option1, {x = W * 0.2, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.55, y = H * 0.6, time = 500})
        elseif rand1 == 2 then
            transition.to(option1, {x = W * 0.55, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.2, y = H * 0.6, time = 500})
        end
    end

    local function instructionFunction()
        verdict.alpha = 0
        local r = math.random(1,2)
        if r == 1 then
            instruction.text = "Tap the BIG animal"
            external.feeds("big")
            big = 1
        else
            instruction.text = "Tap the SMALL animal"
            external.feeds("small")
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
            nextButton.alpha = 1
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
            
        end
    end

    local function nextFunction()
        times = times + 1
        animalNumText.text = "Animal #: "..times
        nextButton.alpha = 0
        chooseAnimal()
    end

    local function startGame()
        times = times + 1
        animalNumText.text = "Animal #: "..times
        transition.to(nextButton, {alpha = 0, time = 200})
        transition.to(startButton, {alpha = 0, time = 200})
        transition.to(backMenuButton, {alpha = 0, time = 200})
        chooseAnimal()
    end

    local function exitGame()
        storyboard.gotoScene("anotherMenu", "fade", 400)
    end

    local function restartGame()
        storyboard.gotoScene("refresh_bigSmall", "fade", 300)
    end

    local function moveScore()
        transition.to(animalNumText, {alpha = 0, time = 200})
        transition.to(scoreText, {x = W * 0.42, y = H * 0.4, time = 500})
    end

    function right()
        verdict.text = "Correct"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        scoreNum = scoreNum + 1
        scoreText.text = "Score: "..scoreNum
        external.feeds("correctFeed")
        -- external.correctionEffects("correct")
        if times == 5 then
            transition.to(endMessage, {alpha = 1, time = 200})
            transition.to(nextButton, {alpha = 0, time = 200})
            external.correctionEffects("yehey")
            moveScore()
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
        else
            transition.to(nextButton, {alpha = 1, time = 200})
        end
    end

    function wrong()
        verdict.text = "Wrong"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        external.feeds("wrongFeed")
        -- external.correctionEffects("wrong")
        if times == 5 then
            transition.to(endMessage, {alpha = 1, time = 200})
            transition.to(nextButton, {alpha = 0, time = 200})
            external.correctionEffects("yehey")
            moveScore()
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
        else
            transition.to(nextButton, {alpha = 1, time = 200})
        end
    end




    startButton:addEventListener("tap", startGame)
    nextButton:addEventListener("tap", nextFunction)
    restartButton:addEventListener("tap", restartGame)
    exitButton:addEventListener("tap", exitGame)

    local function disappearScreen()
        --transition.to(logo, {alpha = 0, time = 2000})
        transition.to(instr, {alpha = 0, time = 1500})
        timer.performWithDelay(1000, mainSplash, 1)
    end
    
    timer.performWithDelay(1500, disappearScreen, 1)
end

function scene:exitScene( event )
    external.setPreviousScene("bigSmall")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

