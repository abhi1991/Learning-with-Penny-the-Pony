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
    local times = 0

    local showColors, option1, option2, option3, right, wrong
    local startButton, startGame, nextButton, restartButton

    local purpleDone = false
    local blueDone = false
    local redDone = false
    local greenDone = false
    local orangeDone = false
    local yellowDone = false
    local blackDone = false
    local brownDone = false
    local whiteDone = false
    local pinkDone = false


    local answer
    local currentNum = 0
    local colorNum = 0
    local scoreNum = 0

    local bg = display.newImageRect("images/backgrounds/tagalogBG_colorMatching.png", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)
    

    local instruction = display.newImage("images/instructions/tagalog_colorMatching.png")
        instruction.x = display.contentWidth * 0.5
        instruction.y = display.contentHeight * 0.5
    instruction:scale(0.7,0.7)
    external.intruct("tagColor")


    local endMessage = display.newText("Mahusay!", 0, 0, "Chinacat", 60)
    endMessage.x = W * 0.3
    endMessage.y = H * 0.35
    endMessage:setTextColor(0,0,0)
    endMessage.alpha = 0
    screenGroup:insert(endMessage)


    local colorNumText = display.newText("Kulay # "..colorNum, 0, 0, "Chinacat", 50)
    colorNumText.x = W * 0.55
    colorNumText.y = H * 0.9
    screenGroup:insert(colorNumText)
    
    local scoreText = display.newText("Puntos: "..scoreNum, 0, 0, "Chinacat", 45)
    scoreText.x = W * 0.8
    scoreText.y = H * 0.9
    screenGroup:insert(scoreText)
    
    local verdict = display.newText("", 0, 0, "Chinacat", 80)
    verdict:setFillColor(0,0,0)
    verdict.x = W * 0.3; verdict.y = H * 0.35
    screenGroup:insert(verdict)










    local function chooseOptionColor(num)
        if num == 1 then
            return "images/colorMatchGame/final/lila.png" 
        elseif num == 2 then
            return "images/colorMatchGame/final/asul.png" 
        elseif num == 3 then
            return "images/colorMatchGame/final/pula.png" 
        elseif num == 4 then
            return "images/colorMatchGame/final/berde.png" 
        elseif num == 5 then
            return "images/colorMatchGame/final/kahel.png" 
        elseif num == 6 then
            return "images/colorMatchGame/final/dilaw.png" 
        elseif num == 7 then
            return "images/colorMatchGame/final/itim.png"
        elseif num == 8 then
            return "images/colorMatchGame/final/kayumanggi.png" 
        elseif num == 9 then
            return "images/colorMatchGame/final/puti.png" 
        elseif num == 10 then
            return "images/colorMatchGame/final/rosas.png" 
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
            
            if colorName == "purple" then
                currentNum = 1
                option1 = display.newImage("images/colorMatchGame/final/lila.png")
                external.color("lila")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "blue" then
                currentNum = 2
                option1 = display.newImage("images/colorMatchGame/final/asul.png")
                external.color("asul")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "red" then
                currentNum = 3
                option1 = display.newImage("images/colorMatchGame/final/pula.png")
                external.color("pula")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "green" then
                currentNum = 4
                option1 = display.newImage("images/colorMatchGame/final/berde.png")
                external.color("berde")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "orange" then
                currentNum = 5
                option1 = display.newImage("images/colorMatchGame/final/kahel.png")
                external.color("kahel")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "yellow" then
                currentNum = 6
                option1 = display.newImage("images/colorMatchGame/final/dilaw.png")
                external.color("dilaw")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "black" then
                currentNum = 7
                option1 = display.newImage("images/colorMatchGame/final/itim.png")
                external.color("itim")
                option1.x = W * 0.35;  option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(2,2)
                screenGroup:insert(option1)
            elseif colorName == "brown" then
                currentNum = 8
                option1 = display.newImage("images/colorMatchGame/final/kayumanggi.png")
                external.color("kayumanggi")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "white" then
                currentNum = 9
                option1 = display.newImage("images/colorMatchGame/final/puti.png")
                external.color("puti")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
                screenGroup:insert(option1)
            elseif colorName == "pink" then
                currentNum = 10
                option1 = display.newImage("images/colorMatchGame/final/rosas.png")
                external.color("rosas")
                option1.x = W * 0.35 option1.y = H * 0.4
                option1:addEventListener("tap", right)
                option1:scale(1.5,1.5)
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
                    option2:scale(1.5,1.5)
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
                    option3:scale(1.5,1.5)
                    screenGroup:insert(option3)
                    check2 = false
                end
            end
           
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

    local function prepareNum(value)
        if colorCount ~= 10 then

            verdict.alpha = 0
            if colorName ~= "" then
                color[colorCount-1]:removeSelf()
            end

            color[colorCount] = display.newImage(value)
            color[colorCount]:scale(0.9,0.9)
            color[colorCount].x = W * 0.28
            color[colorCount].y = H * 0.47
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
            transition.to(option1, {x = W * 0.7, y = H * 0.5, time = 500})
            transition.to(option2, {x = W * 0.7, y = H * 0.35, time = 500})
            transition.to(option3, {x = W * 0.7, y = H * 0.65, time = 500})
        elseif rand1 ==2 then
            transition.to(option1, {x = W * 0.7, y = H * 0.65, time = 500})
            transition.to(option2, {x = W * 0.7, y = H * 0.5, time = 500})
            transition.to(option3, {x = W * 0.7, y = H * 0.35, time = 500})
        elseif rand1 == 3 then
            transition.to(option1, {x = W * 0.7, y = H * 0.35, time = 500})
            transition.to(option2, {x = W * 0.7, y = H * 0.65, time = 500})
            transition.to(option3, {x = W * 0.7, y = H * 0.5, time = 500})
        end
    end


    local function moveScore()
        transition.to(colorNumText, {alpha = 0, time = 500})
        transition.to(scoreText, {x = W * 0.32, y = H * 0.45, time = 500})
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
                prepareNum("images/colorMatchGame/final/purplesmall_pic.png")
                colorName = "purple"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 2 then
            if blueDone == false then
                blueDone = true
                prepareNum("images/colorMatchGame/final/bluesmall_pic.png")
                colorName = "blue"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 3 then
            if redDone == false then
                redDone = true
                prepareNum("images/colorMatchGame/final/redsmall_pic.png")
                colorName = "red"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 4 then
            if greenDone == false then
                greenDone = true
                prepareNum("images/colorMatchGame/final/greensmall_pic.png")
                colorName = "green"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 5 then
            if orangeDone == false then
                orangeDone = true
                prepareNum("images/colorMatchGame/final/orangesmall_pic.png")
                colorName = "orange"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 6 then
            if yellowDone == false then
                yellowDone = true
                prepareNum("images/colorMatchGame/final/yellowsmall_pic.png")
                colorName = "yellow"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 7 then
            if blackDone == false then
                blackDone = true
                prepareNum("images/colorMatchGame/final/blacksmall_pic.png")
                colorName = "black"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 8 then
            if brownDone == false then
                brownDone = true
                prepareNum("images/colorMatchGame/final/brownsmall_pic.png")
                colorName = "brown"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 9 then
            if whiteDone == false then
                whiteDone = true
                prepareNum("images/colorMatchGame/final/whitesmall_pic.png")
                colorName = "white"
                createOptions()
                goHere()
            else
                nextColor()
            end
        elseif rand == 10 then
            if pinkDone == false then
                pinkDone = true
                prepareNum("images/colorMatchGame/final/pinksmall_pic.png")
                colorName = "pink"
                createOptions()
                goHere()
            else
                nextColor()
            end
        end
    end

    function startGame()
        colorNum = colorNum + 1
        colorNumText.text = "Kulay # "..colorNum
        transition.to(exitButton, {alpha = 0, time = 200})
        transition.to(restartButton, {alpha = 0, time = 200})
        transition.to(backMenuButton, {alpha = 0, time = 200})
        transition.to(startButton, {alpha = 0, time = 200})
        showColors()
    end

    local function exitGame()
        storyboard.gotoScene("tagalog_anotherMenu", "fade", 400)
    end

    local function restartGame()
        storyboard.gotoScene("refresh_tagalog_colorMatching", "fade", 300)
    end

    function right()
        verdict.text = "Tama"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
        scoreNum = scoreNum + 1
        scoreText.text = "Puntos: "..scoreNum
        external.feeds("tama")
        -- external.correctionEffects("correct")
        transition.to(nextButton, {alpha = 1, time = 200})
        if colorNum == 5 then
            transition.to(endMessage, {alpha = 1, time = 200})
            transition.to(nextButton, {alpha = 0, time = 200})
            moveScore()
            external.correctionEffects("yehey")
            restartButton.alpha = 1
            exitButton.alpha = 1
            verdict.alpha = 0
        else
            transition.to(nextButton, {alpha = 1, time = 200})
        end
    end

    function wrong()
        verdict.text = "Mali"
        verdict.alpha = 1
        option1.alpha = 0
        option2.alpha = 0
        option3.alpha = 0
        color[colorCount - 1].alpha = 0
        external.feeds("mali")
        -- external.correctionEffects("wrong")
        transition.to(nextButton, {alpha = 1, time = 200})
        if colorNum == 5 then
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
    
    --WIDGETS
    restartButton = widget.newButton
    {
        defaultFile = "buttons/tagalog/replay1.png",
        overFile = "buttons/tagalog/replay1_1.png",
        onRelease = restartGame,
    }
    restartButton.x = display.contentWidth * 0.68
    restartButton.y = display.contentHeight * 0.4
    restartButton:scale(2,2)
    restartButton.alpha = 0
    screenGroup:insert(restartButton)

    exitButton = widget.newButton
    {
        defaultFile = "buttons/tagalog/menu.png",
        overFile = "buttons/tagalog/menu1_1.png",
        onRelease = exitGame,
    }
    exitButton.x = display.contentWidth * 0.68
    exitButton.y = display.contentHeight * 0.6
    exitButton:scale(2,2)
    exitButton.alpha = 0
    screenGroup:insert(exitButton)

    nextButton = widget.newButton
    {
        defaultFile = "buttons/tagalog/next1.png",
        overFile = "buttons/tagalog/next1_1.png",
        onRelease = function()
            colorNum = colorNum + 1
            colorNumText.text = "Kulay # "..colorNum
            showColors()
        end,
    }
    nextButton.x = verdict.x
    nextButton.y = H * 0.6
    nextButton:scale(2,2)
    nextButton.alpha = 0
    screenGroup:insert(nextButton)

    startButton = widget.newButton
    {
        defaultFile = "buttons/tagalog/simula1.png",
        overFile = "buttons/tagalog/simula1_1.png",
        onRelease = startGame,
    }
    startButton.x = W * 0.68
    startButton.y = H * 0.4
    startButton:scale(2.5,2.5)
    screenGroup:insert(startButton)

    backMenuButton = widget.newButton
    {
        defaultFile = "buttons/tagalog/menu.png",
        overFile = "buttons/tagalog/menu1_1.png",
        onRelease = function()
        storyboard.gotoScene( "tagalog_anotherMenu", "fade", 400 )
        end,
    }
    backMenuButton.x = display.contentWidth * 0.68
    backMenuButton.y = display.contentHeight * 0.6
    backMenuButton:scale(2,2)
    screenGroup:insert(backMenuButton)
    


    restartButton:addEventListener("tap", restartGame)
    exitButton:addEventListener("tap", exitGame)

    local function disappearScreen()
        --transition.to(logo, {alpha = 0, time = 2000})
        transition.to(instruction, {alpha = 0, time = 1500})
        timer.performWithDelay(1000, mainSplash, 1)
    end
    
    timer.performWithDelay(1500, disappearScreen, 1)
end

function scene:exitScene( event )
    external.setPreviousScene("tagalog_colorMatching")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

