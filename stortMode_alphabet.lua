local storyboard = require("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
local external = require("external")

function scene:willEnterScene( event )
    local group = self.view
    storyboard.removeAll()
    storyboard.removeScene("balloonGame")
end

function scene:createScene( event )
    local screenGroup = self.view
    
    local answer1 = false
    local answer2 = false
    local answer3 = false
    local answer4 = false
    local answer5 = false
    local answer6 = false
    
    local set, answer
    local rand = math.random(1,5)
    local rand2 = math.random(1,4)

    local instruction = display.newImage("images/instructions/arrangeAlphabet.png")
        instruction.x = display.contentWidth * 0.5
        instruction.y = display.contentHeight * 0.5
    instruction:scale(0.7,0.7)
    
    if rand == 1 then
        if rand2 == 1 then
            set = {'B','C','A','E','D','-'}
        elseif rand2 == 2 then
            set = {'D','A','C','E','B','-'}
        elseif rand2 == 3 then
            set = {'C','D','B','A','E','-'}
        elseif rand2 == 4 then
            set = {'E','B','C','D','A','-'}
        end
        answer = {'A','B','C','D','E'}
    elseif rand == 2 then
        if rand2 == 1 then
            set = {'G','I','H','J','F','-'}
        elseif rand2 == 2 then
            set = {'H','F','G','I','J','-'}
        elseif rand2 == 3 then
            set = {'J','H','I','F','G','-'}
        elseif rand2 == 4 then
            set = {'I','J','F','G','H','-'}
        end
        answer = {'F','G','H','I','J'}
    elseif rand == 3 then
        if rand2 == 1 then
            set = {'O','L','N','M','K','-'}
        elseif rand2 == 2 then
            set = {'M','L','N','K','O','-'}
        elseif rand2 == 3 then
            set = {'N','O','K','M','L','-'}
        elseif rand2 == 4 then
            set = {'L','N','O','K','M','-'}
        end
        answer = {'K','L','M','N','O'}
    elseif rand == 4 then
        if rand2 == 1 then
            set = {'Q','S','R','T','P','-'}
        elseif rand2 == 2 then
            set = {'S','T','Q','P','R','-'}
        elseif rand2 == 3 then
            set = {'T','P','R','Q','S','-'}
        elseif rand2 == 4 then
            set = {'P','S','T','Q','R','-'}
        end
        answer = {'P','Q','R','S','T'}
    elseif rand == 5 then
        if rand2 == 1 then 
            set = {'Z','X','Y','V','W','U'}
        elseif rand2 ==  2 then
            set = {'X','W','V','Z','U','Y'}
        elseif rand2 == 3 then
            set = {'U','Z','Y','X','V','W'}
        elseif rand2 == 4 then
            set = {'X','Y','W','U','V','Z'}
        end
        answer = {'U','V','W','X','Y','Z'}
    end     
    
    local bg = display.newImageRect("images/bground.png", display.contentWidth, display.contentHeight)
    bg.x = display.contentWidth * 0.5
    bg.y = display.contentHeight * 0.5
    screenGroup:insert(bg)
    
    local bathtub = display.newImage("images/bathtub.png")
    bathtub.x = display.contentWidth * 0.5
    bathtub.y = display.contentHeight * 0.8
    screenGroup:insert(bathtub)
    
    local bubble1 = display.newImage("images/bubble.png")
    if rand == 5 then
        bubble1.x = display.contentWidth * 0.1875
    else
        bubble1.x = display.contentWidth * 0.25
    end
    bubble1.y = display.contentHeight * 0.5
    bubble1:scale(3.5,3.5)
    screenGroup:insert(bubble1)
    
    local bubble2 = display.newImage("images/bubble.png")
    if rand == 5 then
        bubble2.x = display.contentWidth * 0.3125
    else
        bubble2.x = display.contentWidth * 0.375
    end
    bubble2.y = display.contentHeight * 0.5
    bubble2:scale(3.5,3.5)
    screenGroup:insert(bubble2)
    
    local bubble3 = display.newImage("images/bubble.png")
    if rand == 5 then
        bubble3.x = display.contentWidth * 0.4375
    else
        bubble3.x = display.contentWidth * 0.5
    end
    bubble3.y = display.contentHeight * 0.5
    bubble3:scale(3.5,3.5)
    screenGroup:insert(bubble3)
    
    local bubble4 = display.newImage("images/bubble.png")
    if rand == 5 then
        bubble4.x = display.contentWidth * 0.5625
    else
        bubble4.x = display.contentWidth * 0.625
    end
    bubble4.y = display.contentHeight * 0.5
    bubble4:scale(3.5,3.5)
    screenGroup:insert(bubble4)
    
    local bubble5 = display.newImage("images/bubble.png")
    if rand == 5 then
        bubble5.x = display.contentWidth * 0.6875
    else
        bubble5.x = display.contentWidth * 0.75
    end
    bubble5.y = display.contentHeight * 0.5
    bubble5:scale(3.5,3.5)
    screenGroup:insert(bubble5)
    
    local bubble6 = display.newImage("images/bubble.png")
    bubble6.x = display.contentWidth * 0.8125
    bubble6.y = display.contentHeight * 0.5
    bubble6:scale(3.5,3.5)
    if rand ~= 5 then
        bubble6.alpha = 0
    end
    screenGroup:insert(bubble6)

    local letter1 = display.newText(set[1], 0, 0, "HVD Comic Serif Pro", 40)
    letter1.x = bubble1.x
    letter1.y = bubble1.y
    letter1:setFillColor(0,0,0)
    screenGroup:insert(letter1)
    
    local letter2 = display.newText(set[2], 0, 0, "HVD Comic Serif Pro", 40)
    letter2.x = bubble2.x
    letter2.y = bubble2.y
    letter2:setFillColor(0,0,0)
    screenGroup:insert(letter2)
    
    local letter3 = display.newText(set[3], 0, 0, "HVD Comic Serif Pro", 40)
    letter3.x = bubble3.x
    letter3.y = bubble3.y
    letter3:setFillColor(0,0,0)
    screenGroup:insert(letter3)
    
    local letter4 = display.newText(set[4], 0, 0, "HVD Comic Serif Pro", 40)
    letter4.x = bubble4.x
    letter4.y = bubble4.y
    letter4:setFillColor(0,0,0)
    screenGroup:insert(letter4)
    
    local letter5 = display.newText(set[5], 0, 0, "HVD Comic Serif Pro", 40)
    letter5.x = bubble5.x
    letter5.y = bubble5.y
    letter5:setFillColor(0,0,0)
    screenGroup:insert(letter5)
    
    local letter6 = display.newText(set[6], 0, 0, "HVD Comic Serif Pro", 40)
    letter6.x = bubble6.x
    letter6.y = bubble6.y
    letter6:setFillColor(0,0,0)
    if rand ~= 5 then
        letter6.alpha = 0
    end
    screenGroup:insert(letter6)
    
    local function function1()
        if set[1] == answer[1] then
            answer1 = true
            if rand == 5 then
                transition.to(bubble1, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter1, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            else
                transition.to(bubble1, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter1, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[1] == answer[2] then
            if answer1 == true then
                answer2 = true
                if rand == 5 then
                    transition.to(bubble1, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble1, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[1] == answer[3] then
            if answer2 == true then
                answer3 = true
                if rand == 5 then
                    transition.to(bubble1, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble1, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[1] == answer[4] then
            if answer3 == true then
                answer4 = true
                if rand == 5 then
                    transition.to(bubble1, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble1, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[1] == answer[5] then
            if answer4 == true then
                answer5 = true
                if rand == 5 then
                    transition.to(bubble1, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble1, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[1] == answer[6] then
            if answer5 == true then
                answer6 = true
                if rand == 5 then
                    transition.to(bubble1, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter1, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                end
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    local function function2()
        if set[2] == answer[1] then
            answer1 = true
            if rand == 5 then
                transition.to(bubble2, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter2, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            else
                transition.to(bubble2, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter2, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[2] == answer[2] then
            if answer1 == true then
                answer2 = true
                if rand == 5 then
                    transition.to(bubble2, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble2, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[2] == answer[3] then
            if answer2 == true then
                answer3 = true
                if rand == 5 then
                    transition.to(bubble2, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble2, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[2] == answer[4] then
            if answer3 == true then
                answer4 = true
                if rand == 5 then
                    transition.to(bubble2, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble2, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[2] == answer[5] then
            if answer4 == true then
                answer5 = true
                if rand == 5 then
                    transition.to(bubble2, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble2, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[2] == answer[6] then
            if answer5 == true then
                answer6 = true
                if rand == 5 then
                    transition.to(bubble2, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter2, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                end
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    local function function3()
        if set[3] == answer[1] then
            answer1 = true
            if rand == 5 then
                transition.to(bubble3, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter3, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            else
                transition.to(bubble3, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter3, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[3] == answer[2] then
            if answer1 == true then
                answer2 = true
                if rand == 5 then
                    transition.to(bubble3, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble3, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[3] == answer[3] then
            if answer2 == true then
                answer3 = true
                if rand == 5 then
                    transition.to(bubble3, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble3, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[3] == answer[4] then
            if answer3 == true then
                answer4 = true
                if rand == 5 then
                    transition.to(bubble3, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble3, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[3] == answer[5] then
            if answer4 == true then
                answer5 = true
                if rand == 5 then
                    transition.to(bubble3, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble3, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[3] == answer[6] then
            if answer5 == true then
                answer6 = true
                if rand == 5 then
                    transition.to(bubble3, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter3, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                end
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    local function function4()
        if set[4] == answer[1] then
            answer1 = true
            if rand == 5 then
                transition.to(bubble4, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter4, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            else
                transition.to(bubble4, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter4, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[4] == answer[2] then
            if answer1 == true then
                answer2 = true
                if rand == 5 then
                    transition.to(bubble4, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble4, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[4] == answer[3] then
            if answer2 == true then
                answer3 = true
                if rand == 5 then
                    transition.to(bubble4, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble4, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[4] == answer[4] then
            if answer3 == true then
                answer4 = true
                if rand == 5 then
                    transition.to(bubble4, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble4, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[4] == answer[5] then
            if answer4 == true then
                answer5 = true
                if rand == 5 then
                    transition.to(bubble4, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble4, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[4] == answer[6] then
            if answer5 == true then
                answer6 = true
                if rand == 5 then
                    transition.to(bubble4, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter4, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                end
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    local function function5()
        if set[5] == answer[1] then
            answer1 = true
            if rand == 5 then
                transition.to(bubble5, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter5, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            else
                transition.to(bubble5, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter5, {x = display.contentWidth * 0.25, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[5] == answer[2] then
            if answer1 == true then
                answer2 = true
                if rand == 5 then
                    transition.to(bubble5, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble5, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.375, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[5] == answer[3] then
            if answer2 == true then
                answer3 = true
                if rand == 5 then
                    transition.to(bubble5, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble5, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.5, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[5] == answer[4] then
            if answer3 == true then
                answer4 = true
                if rand == 5 then
                    transition.to(bubble5, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble5, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.625, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[5] == answer[5] then
            if answer4 == true then
                answer5 = true
                if rand == 5 then
                    transition.to(bubble5, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                else
                    transition.to(bubble5, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.75, y = display.contentHeight * 0.15, time = 350})
                end
            end
        elseif set[5] == answer[6] then
            if answer5 == true then
                answer6 = true
                if rand == 5 then
                    transition.to(bubble5, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                    transition.to(letter5, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                end
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    local function function6()
        if set[6] == answer[1] then
            answer1 = true
            transition.to(bubble6, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
            transition.to(letter6, {x = display.contentWidth * 0.1865, y = display.contentHeight * 0.15, time = 350})
        elseif set[6] == answer[2] then
            if answer1 == true then
                answer2 = true
                transition.to(bubble6, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter6, {x = display.contentWidth * 0.3125, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[6] == answer[3] then
            if answer2 == true then
                answer3 = true
                transition.to(bubble6, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter6, {x = display.contentWidth * 0.4375, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[6] == answer[4] then
            if answer3 == true then
                answer4 = true
                transition.to(bubble6, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter6, {x = display.contentWidth * 0.5625, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[6] == answer[5] then
            if answer4 == true then
                answer5 = true
                transition.to(bubble6, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter6, {x = display.contentWidth * 0.6875, y = display.contentHeight * 0.15, time = 350})
            end
        elseif set[6] == answer[6] then
            if answer5 == true then
                answer6 = true
                transition.to(bubble6, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
                transition.to(letter6, {x = display.contentWidth * 0.8125, y = display.contentHeight * 0.15, time = 350})
            end
        else
            external.correctionEffects("wrong")
            system.vibrate()
        end
    end
    
    bubble1:addEventListener("tap", function1)
    bubble2:addEventListener("tap", function2)
    bubble3:addEventListener("tap", function3)
    bubble4:addEventListener("tap", function4)
    bubble5:addEventListener("tap", function5)
    bubble6:addEventListener("tap", function6)
    if rand == 5 then
        bubble6:addEventListener("tap", function6)
    end
    
    local backButton = widget.newButton{
        defaultFile = "images/back.png",
        overFile = "images/backover.png",
        onRelease = function()
            storyboard.gotoScene("anotherMenu", "fade", 300)
        end,
    }
    backButton.x = display.contentWidth * 0.075
    backButton.y = display.contentHeight * 0.075
    screenGroup:insert(backButton)


    local function disappearScreen()
        --transition.to(logo, {alpha = 0, time = 2000})
        transition.to(instruction, {alpha = 0, time = 2000})
        timer.performWithDelay(1000, mainSplash, 1)
    end
    
    timer.performWithDelay(2000, disappearScreen, 1)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

