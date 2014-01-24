local storyboard = require "storyboard"
local scene = storyboard.newScene()
local external = require("external")

local effects
local count = 0
local num = 0
local done = false
local game = false
local control

function scene:createScene( event )
    local screenGroup = self.view
    
    storyboard.removeScene("menu")


    local splashScreen = display.newImageRect("images/bg2.jpg", display.contentWidth, display.contentHeight)
    splashScreen.x = display.contentWidth * 0.5
    splashScreen.y = display.contentHeight * 0.5
    
    local function mainSplash()        
        local title = display.newImageRect("images/bg1.jpg", display.contentWidth, display.contentHeight)
        title.x = display.contentWidth * 0.5
        title.y = display.contentHeight * 0.5
        --title:scale(1.75,1.75)
        
        local circle = display.newImage("images/circle_yellow.png")
        circle.x = display.contentWidth * 0.2
        circle.y = display.contentHeight * 0.4
        circle.rotate = 20
        
        local circle2 = display.newImage("images/circle_green.png")
        circle2.x = display.contentWidth * 0.3
        circle2.y = display.contentHeight * 0.4
        circle2.rotate = 20
        
        local circle3 = display.newImage("images/circle_blue.png")
        circle3.x = display.contentWidth * 0.4
        circle3.y = display.contentHeight * 0.4
        circle3.rotate = 20
        
        local circle4 = display.newImage("images/circle_red.png")
        circle4.x = display.contentWidth * 0.5
        circle4.y = display.contentHeight * 0.4
        circle4.rotate = 20
        
        local circle5 = display.newImage("images/circle_yellow.png")
        circle5.x = display.contentWidth * 0.6
        circle5.y = display.contentHeight * 0.4
        circle5.rotate = 20
        
        local circle6 = display.newImage("images/circle_green.png")
        circle6.x = display.contentWidth * 0.7
        circle6.y = display.contentHeight * 0.4
        circle6.rotate = 20
        
        local circle7 = display.newImage("images/circle_blue.png")
        circle7.x = display.contentWidth * 0.8
        circle7.y = display.contentHeight * 0.4
        circle7.rotate = 20
        
        local button = display.newRect(0,0,425,90)
        button.x = display.contentWidth * 0.5
        button.y = display.contentHeight * 0.4
        button.alpha = 0.01
        
    
    
        external.playMusic()
                
        -- LOADING --
        local l = display.newText("L", 0,0, "Chinacat", 60)
        l.x = circle.x
        l.y = circle.y
        l:setFillColor(204,229,255)
        
        local o = display.newText("O", 0,0, "Chinacat", 60)
        o.x = circle2.x
        o.y = circle2.y
        o:setFillColor(204,229,255)
        
        local a = display.newText("A", 0,0, "Chinacat", 60)
        a.x = circle3.x
        a.y = circle3.y
        a:setFillColor(204,229,255)
        
        local d = display.newText("D", 0,0, "Chinacat", 60)
        d.x = circle4.x
        d.y = circle4.y
        d:setFillColor(204,229,255)
        
        local i = display.newText("I", 0,0, "Chinacat", 60)
        i.x = circle5.x
        i.y = circle5.y
        i:setFillColor(204,229,255)
        
        local n = display.newText("N", 0,0, "Chinacat", 60)
        n.x = circle6.x
        n.y = circle6.y
        n:setFillColor(204,229,255)
        
        local g = display.newText("G", 0,0, "Chinacat", 60)
        g.x = circle7.x
        g.y = circle7.y
        g:setFillColor(204,229,255)
        
        -- START --
        local sStart = display.newText("S", 0,0, "Chinacat", 60)
        sStart.x = circle2.x
        sStart.y = circle2.y
        sStart:setFillColor(204,229,255)
        sStart.alpha = 0
        
        local tStart = display.newText("T", 0,0, "Chinacat", 60)
        tStart.x = circle3.x
        tStart.y = circle3.y
        tStart:setFillColor(204,229,255)
        tStart.alpha = 0
        
        local aStart = display.newText("A", 0,0, "Chinacat", 60)
        aStart.x = circle4.x
        aStart.y = circle4.y
        aStart:setFillColor(204,229,255)
        aStart.alpha = 0
        
        local rStart = display.newText("R", 0,0, "Chinacat", 60)
        rStart.x = circle5.x
        rStart.y = circle5.y
        rStart:setFillColor(204,229,255)
        rStart.alpha = 0
        
        local t2Start = display.newText("T", 0,0, "Chinacat", 60)
        t2Start.x = circle6.x
        t2Start.y = circle6.y
        t2Start:setFillColor(204,229,255)
        t2Start.alpha = 0
        
        
        local function effects8()
            transition.to(g, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle7, {xScale = 1, yScale = 1, time = 300})
            count = count + 1
            if count == 2 then
                done = true
            end
            timer.performWithDelay(200, effects, 1)
        end
        
        local function effects7()
            transition.to(n, {xScale = 1, yScale = 1, time = 300})
            transition.to(g, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle6, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle7, {xScale = 2, yScale = 2, time = 300})
            timer.performWithDelay(200, effects8, 1)
        end
        
        local function effects6()
            transition.to(i, {xScale = 1, yScale = 1, time = 300})
            transition.to(n, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle5, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle6, {xScale = 2, yScale = 2, time = 300})
            timer.performWithDelay(200, effects7, 1)
        end
        
        local function effects5()
            transition.to(d, {xScale = 1, yScale = 1, time = 300})
            transition.to(i, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle4, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle5, {xScale = 2, yScale = 2, time = 300})
            timer.performWithDelay(200, effects6, 1)
        end
        
        local function effects4()
            transition.to(a, {xScale = 1, yScale = 1, time = 300})
            transition.to(d, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle3, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle4, {xScale = 2, yScale = 2, time = 300})
            timer.performWithDelay(200, effects5, 1)
        end
        
        local function effects3()
            transition.to(o, {xScale = 1, yScale = 1, time = 300})
            transition.to(a, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle2, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle3, {xScale = 1.5, yScale = 1.5, time = 300})
            timer.performWithDelay(200, effects4, 1)
        end
        
        local function effects2()
            transition.to(l, {xScale = 1, yScale = 1, time = 300})
            transition.to(o, {xScale = 2, yScale = 2, time = 300})
            transition.to(circle, {xScale = 1, yScale = 1, time = 300})
            transition.to(circle2, {xScale = 1.5, yScale = 1.5, time = 300})
            
            timer.performWithDelay(200, effects3, 1)
        end
        
        effects = function()
            if done == false then
                transition.to(l, {xScale = 2, yScale = 2, time = 300})
                transition.to(circle, {xScale = 1.5, yScale = 1.5, time = 300})
                timer.performWithDelay(300, effects2, 1)
            else
                game = true
                transition.to(l, {rotation = 180, alpha = 0, time = 300})
                transition.to(o, {rotation = 180, alpha = 0, time = 300})
                transition.to(a, {rotation = 180, alpha = 0, time = 300})
                transition.to(d, {rotation = 180, alpha = 0, time = 300})
                transition.to(i, {rotation = 180, alpha = 0, time = 300})
                transition.to(n, {rotation = 180, alpha = 0, time = 300})
                transition.to(g, {rotation = 180, alpha = 0, time = 300})
                transition.to(sStart, {rotation = 360, alpha = 1, time = 300})
                transition.to(tStart, {rotation = 360, alpha = 1, time = 300})
                transition.to(aStart, {rotation = 360, alpha = 1, time = 300})
                transition.to(rStart, {rotation = 360, alpha = 1, time = 300})
                transition.to(t2Start, {rotation = 360, alpha = 1, time = 300})
                transition.to(circle, {x = circle2.x, alpha = 1, time = 300})
                transition.to(circle7, {x = circle6.x, alpha = 1, time = 300})
            end
        end
        
        local function gotoMenu()
            if game == true then
                storyboard.gotoScene( "menu", "fade", 300 )
            end
        end
        
        timer.performWithDelay(100, effects, 1)
        
        button:addEventListener("tap", gotoMenu)
        
        --screenGroup:insert(background)
        screenGroup:insert(title)
        screenGroup:insert(circle)
        screenGroup:insert(circle2)
        screenGroup:insert(circle3)
        screenGroup:insert(circle4)
        screenGroup:insert(circle5)
        screenGroup:insert(circle6)
        screenGroup:insert(circle7)
        screenGroup:insert(l)
        screenGroup:insert(o)
        screenGroup:insert(a)
        screenGroup:insert(d)
        screenGroup:insert(i)
        screenGroup:insert(n)
        screenGroup:insert(g)
        screenGroup:insert(sStart)
        screenGroup:insert(tStart)
        screenGroup:insert(aStart)
        screenGroup:insert(rStart)
        screenGroup:insert(t2Start)
        screenGroup:insert(button)
    end
    
    local function disappearScreen()
        transition.to(splashScreen, {alpha = 0, time = 1000})
        timer.performWithDelay(1000, mainSplash, 1)
    end
    
    timer.performWithDelay(2000, disappearScreen, 1)
    
end

function scene:exitScene( event )
    storyboard.purgeScene("splash")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )

return scene