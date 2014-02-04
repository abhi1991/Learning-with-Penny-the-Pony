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

	--> Add Physics Engine
	local physics = require("physics")
	physics.start()
	physics.setGravity(0,-1)

	--physics.setDrawMode("hybrid")

	local total = 0
	local numberBalloon = 0
	local menuButton, replayButton
	local balloon, balloon2, balloon3, balloon4, balloon5, balloon6, balloon7, balloon8, balloon9, balloon10

	--> Add Background Image
	local background = display.newImageRect("images/7.jpg", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth * 0.5
	background.y = display.contentHeight * 0.5

	--local rainbow = display.newImage ("images/rainbow.png", 900, 300)
	-- local pony = display.newImage ("mainCharacter2.png", 250, 600)

	--background.x = center
	--background.y = center

	local instruction = display.newText("", 0, 0, "Chinacat", 90)
	instruction.x = display.contentWidth * 0.5
	instruction.y = display.contentHeight * 0.5
	instruction:setTextColor(0,0,1)

	local number = display.newText(numberBalloon, 0, 0, "Chinacat", 120)
	number.x = display.contentWidth * 0.5
	number.y = display.contentHeight * 0.3
	number:setTextColor(0,0,0)

	-- local backButton = widget.newButton{
	-- 	defaultFile = "images/backButton.png",
	-- 	overFile = "images/backButtonOver.png",
	-- 	onRelease = function()
	-- 		storyboard.gotoScene("menu","fade",400)
	-- 	end,
	-- }
	-- backButton.x = 10
	-- backButton.y = display.contentHeight * 0.1
	-- backButton:scale(2,2)

	local function createBalloons()
		balloon = display.newImage("images/pop1.png")
		balloon.width = 180
		balloon.height = 200
		balloon.x = display.contentWidth * 0.15
		balloon.y = display.contentHeight * 0.75
		physics.addBody(balloon, {bounce = 0.5, radius = 100, friction = 1.0})
		balloon.myName = "balloon"
		
		balloon2 = display.newImage("images/pop2.png")
		balloon2.width = 180
		balloon2.height = 200
		balloon2.x = display.contentWidth * 0.30
		balloon2.y = display.contentHeight * 0.75
		physics.addBody(balloon2, {bounce = 0.4, radius = 100, friction = 1.0})
		balloon2.myName = "balloon"

		balloon3 = display.newImage("images/pop3.png")
		balloon3.width = 180
		balloon3.height = 200
		balloon3.x = display.contentWidth * 0.5
		balloon3.y = display.contentHeight * 0.75
		physics.addBody(balloon3, {bounce = 0.3, radius = 100, friction = 1.0})
		balloon3.myName = "balloon"

		balloon4 = display.newImage("images/pop4.png")
		balloon4.width = 180
		balloon4.height = 200
		balloon4.x = display.contentWidth * 0.70
		balloon4.y = display.contentHeight * 0.75
		physics.addBody(balloon4, {bounce = 0.5, radius = 100, friction = 1.0})
		balloon4.myName = "balloon"

		balloon5 = display.newImage("images/pop5.png")
		balloon5.width = 180
		balloon5.height = 200
		balloon5.x = display.contentWidth * 0.85
		balloon5.y = display.contentHeight * 0.75
		physics.addBody(balloon5, {bounce = 0.4, radius = 100, friction = 1.0})
		balloon5.myName = "balloon"

		balloon6 = display.newImage("images/pop6.png")
		balloon6.width = 180
		balloon6.height = 200
		balloon6.x = display.contentWidth * 0.15
		balloon6.y = display.contentHeight * 0.5
		physics.addBody(balloon6, {density = -1, bounce = 0.5, radius = 100, friction = 1.0})
		balloon6.myName = "balloon"
		
		balloon7 = display.newImage("images/pop7.png")
		balloon7.width = 180
		balloon7.height = 200
		balloon7.x = display.contentWidth * 0.30
		balloon7.y = display.contentHeight * 0.5
		physics.addBody(balloon7, {density = 0.05, bounce = 0.4, radius = 100, friction = 1.0})
		balloon7.myName = "balloon"

		balloon8 = display.newImage("images/pop8.png")
		balloon8.width = 180
		balloon8.height = 200
		balloon8.x = display.contentWidth * 0.5
		balloon8.y = display.contentHeight * 0.5
		physics.addBody(balloon8, {density = 0.05, bounce = 0.3, radius = 100, friction = 1.0})
		balloon8.myName = "balloon"

		balloon9 = display.newImage("images/pop4.png")
		balloon9.width = 180
		balloon9.height = 200
		balloon9.x = display.contentWidth * 0.70
		balloon9.y = display.contentHeight * 0.5
		physics.addBody(balloon9, {density = 0.05, bounce = 0.5, radius = 100, friction = 1.0})
		balloon9.myName = "balloon"

		balloon10 = display.newImage("images/pop2.png")
		balloon10.width = 180
		balloon10.height = 200
		balloon10.x = display.contentWidth * 0.85
		balloon10.y = display.contentHeight * 0.5
		physics.addBody(balloon10, {density = 0.05, bounce = 0.4, radius = 100, friction = 1.0})
		balloon10.myName = "balloon"
	end

	
	-- local leftWall = display.newRect(0, 0, 1, display.contentHeight	)
	-- local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight	)
	-- local ceiling = display.newRect(0, 0, display.contentWidth, 1 )
	
	
	-- physics.addBody(leftWall, "static", {bounce = 0.0, friction = 1.0})
	-- physics.addBody(rightWall, "static", {bounce = 0.0, friction = 1.0})
	-- physics.addBody(ceiling, "static", {bounce = 0.0, friction = 1.0})

	--> Add Floor
	-- local floor = display.newImage("images/border.png", 100,50)
	-- floor.y = display.contentHeight - floor.stageHeight
	-- physics.addBody(floor, "static", {bounce = 0.0, friction = 1.0})

	local floor = display.newRect(0,0,1000,0)
	floor.x = display.contentWidth * 0.5
	floor.y = display.contentHeight - floor.stageHeight
	floor:setFillColor(0,0,0,1)
	physics.addBody(floor, "static", {bounce = 0.5, friction = 1.0})

        local top = display.newRect(0,0,1500,10)
        top.x = display.contentWidth * 0.5
        top.y = 0
        top:setFillColor(0,0,0,10)
        physics.addBody(top, "static")
        
        local leftWall = display.newRect(0,0,10,1000)
        leftWall.x = display.contentWidth + 20
        leftWall.y = display.contentHeight * 0.5
        leftWall:setFillColor(0,0,0,10)
        physics.addBody(leftWall, "static")
        
        local rightWall = display.newRect(0,0,10,1000)
        rightWall.x = -20
        rightWall.y = display.contentHeight * 0.5
        rightWall:setFillColor(0,0,0,10)
        physics.addBody(rightWall, "static")
        
	-- local ceiling = display.newRect(0,0,1000,0)
	-- ceiling.x = display.contentWidth - floor.stageHeight
	-- ceiling.y = display.contentHeight * 1
	-- ceiling:setFillColor(0,0,0,0)
	-- physics.addBody(ceiling, "static", {bounce = 0.5, friction = 1.0})

	--> Touch Event Listener

	local function instructionFunction()
		local rand = math.random(1,10)

		if rand == 1 then
			instruction.text = "Tap 1 balloon"
			total = 1
		elseif rand == 2 then
			instruction.text = "Tap 2 balloons"
			total = 2
		elseif rand == 3 then
			instruction.text = "Tap 3 balloons"
			total = 3
		elseif rand == 4 then
			instruction.text = "Tap 4 balloons"
			total = 4
		elseif rand == 5 then
			instruction.text = "Tap 5 balloons"
			total = 5
		elseif rand == 6 then
			instruction.text = "Tap 6 balloons"
			total = 6
		elseif rand == 7 then
			instruction.text = "Tap 7 balloons"
			total = 7
		elseif rand == 8 then
			instruction.text = "Tap 8 balloons"
			total = 8
		elseif rand == 9 then
			instruction.text = "Tap 9 balloons"
			total = 9
		else
			instruction.text = "Tap 10 balloons"
			total = 10
		end
	end

	local function moveBalloon(event)
		local balloon = event.target
		balloon:applyLinearImpulse(0, -0.2, event.x, event.y)
	end

	local function check()
		if total == numberBalloon then
			instruction.text = "Very Good!!"
			transition.to(balloon, {alpha = 0, time = 500})
			transition.to(balloon2, {alpha = 0, time = 500})
			transition.to(balloon3, {alpha = 0, time = 500})
			transition.to(balloon4, {alpha = 0, time = 500})
			transition.to(balloon5, {alpha = 0, time = 500}) 
			transition.to(balloon6, {alpha = 0, time = 500})
			transition.to(balloon7, {alpha = 0, time = 500})
			transition.to(balloon8, {alpha = 0, time = 500})
			transition.to(balloon9, {alpha = 0, time = 500})
			transition.to(balloon10, {alpha = 0, time = 500}) 
			transition.to(replayButton, {alpha = 1, time = 500})
			transition.to(menuButton, {alpha = 1, time = 500})
			external.soundEffects("finish")
		end
	end

	local function tapBalloon1()
		balloon:removeSelf()
		balloon.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon2()
		balloon2:removeSelf()
		balloon2.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon3()
		balloon3:removeSelf()
		balloon3.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon4()
		balloon4:removeSelf()
		balloon4.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon5()
		balloon5:removeSelf()
		balloon5.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon6()
		balloon6:removeSelf()
		balloon6.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon7()
		balloon7:removeSelf()
		balloon7.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon8()
		balloon8:removeSelf()
		balloon8.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon9()
		balloon9:removeSelf()
		balloon9.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function tapBalloon10()
		balloon10:removeSelf()
		balloon10.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	



	local function goToMenu()
		storyboard.gotoScene( "anotherMenu", "fade", 400 )
	end

	local function restartGame()
		storyboard.gotoScene("refresh_balloonGame", "fade", 300)
		-- numberBalloon = 0
		-- number.text = numberBalloon

		-- if balloon.myName ~= nil then
		-- 	balloon:removeSelf()
		-- 	balloon.myName = nil
		-- end
		-- if balloon2.myName ~= nil then
		-- 	balloon2:removeSelf()
		-- 	balloon2.myName = nil
		-- end
		-- if balloon3.myName ~= nil then
		-- 	balloon3:removeSelf()
		-- 	balloon3.myName = nil
		-- end
		-- if balloon4.myName ~= nil then
		-- 	balloon4:removeSelf()
		-- 	balloon4.myName = nil
		-- end
		-- if balloon5.myName ~= nil then
		-- 	balloon5:removeSelf()
		-- 	balloon5.myName = nil
		-- end
		-- if balloon6.myName ~= nil then
		-- 	balloon6:removeSelf()
		-- 	balloon6.myName = nil
		-- end
		-- if balloon7.myName ~= nil then
		-- 	balloon7:removeSelf()
		-- 	balloon7.myName = nil
		-- end
		-- if balloon8.myName ~= nil then
		-- 	balloon8:removeSelf()
		-- 	balloon8.myName = nil
		-- end
		-- if balloon9.myName ~= nil then
		-- 	balloon9:removeSelf()
		-- 	balloon9.myName = nil
		-- end
		-- if balloon10.myName ~= nil then
		-- 	balloon10:removeSelf()
		-- 	balloon10.myName = nil
		-- end
		-- instructionFunction()
		-- createBalloons()
		-- transition.to(menuButton, {alpha = 0, time = 300})
		-- transition.to(replayButton, {alpha = 0, time = 300})

		-- --Return listeners
		-- balloon:addEventListener("tap", tapBalloon1)
		-- balloon2:addEventListener("tap", tapBalloon2)
		-- balloon3:addEventListener("tap", tapBalloon3)
		-- balloon4:addEventListener("tap", tapBalloon4)
		-- balloon5:addEventListener("tap", tapBalloon5)
		-- balloon6:addEventListener("tap", tapBalloon6)
		-- balloon7:addEventListener("tap", tapBalloon7)
		-- balloon8:addEventListener("tap", tapBalloon8)
		-- balloon9:addEventListener("tap", tapBalloon9)
		-- balloon10:addEventListener("tap", tapBalloon10)
	end

	-- WIDGETS 

	replayButton = widget.newButton
    {
        defaultFile = "buttons/replay.png",
        overFile = "buttons/replayOver.png",
        onRelease = restartGame,
    }
    replayButton.x = display.contentWidth * 0.5
    replayButton.y = display.contentHeight * 0.55
    replayButton:scale(3,3)
    replayButton.alpha = 0

	menuButton = widget.newButton
    {
        defaultFile = "buttons/menu.png",
        overFile = "buttons/menuOver.png",
        onRelease = goToMenu,
    }
    menuButton.x = display.contentWidth * 0.5
    menuButton.y = display.contentHeight * 0.75
    menuButton:scale(3,3)
    menuButton.alpha = 0

    -- START
	instructionFunction()
	createBalloons()

	--> Add Listener to the balloon
	balloon:addEventListener("tap", tapBalloon1)
	balloon2:addEventListener("tap", tapBalloon2)
	balloon3:addEventListener("tap", tapBalloon3)
	balloon4:addEventListener("tap", tapBalloon4)
	balloon5:addEventListener("tap", tapBalloon5)
	balloon6:addEventListener("tap", tapBalloon6)
	balloon7:addEventListener("tap", tapBalloon7)
	balloon8:addEventListener("tap", tapBalloon8)
	balloon9:addEventListener("tap", tapBalloon9)
	balloon10:addEventListener("tap", tapBalloon10)

	screenGroup:insert(background)
	--screenGroup:insert(rainbow)
	screenGroup:insert(balloon)
	screenGroup:insert(balloon2)
	screenGroup:insert(balloon3)
	screenGroup:insert(balloon4)
	screenGroup:insert(balloon5)
	screenGroup:insert(balloon6)
	screenGroup:insert(balloon7)
	screenGroup:insert(balloon8)
	screenGroup:insert(balloon9)
	screenGroup:insert(balloon10)
	screenGroup:insert(instruction)
	screenGroup:insert(number)
	screenGroup:insert(floor)
	screenGroup:insert(replayButton)
	screenGroup:insert(menuButton)
        screenGroup:insert(rightWall)
        screenGroup:insert(leftWall)
        screenGroup:insert(top)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

