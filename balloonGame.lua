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
	physics.setGravity(0,5.5)

	--physics.setDrawMode("hybrid")

	local total = 0
	local numberBalloon = 0
	local menuButton, replayButton
	local balloon, balloon2, balloon3, balloon4, balloon5

	--> Add Background Image
	local background = display.newImage("images/bg1.jpg")
	background.x = display.contentWidth * 0.5
	background.y = display.contentHeight * 0.5

	--local rainbow = display.newImage ("images/rainbow.png", 900, 300)
	-- local pony = display.newImage ("mainCharacter2.png", 250, 600)

	--background.x = center
	--background.y = center

	local instruction = display.newText("", 0, 0, native.systemFont, 100)
	instruction.x = display.contentWidth * 0.5
	instruction.y = display.contentHeight * 0.15
	instruction:setTextColor(0,0,0)

	local number = display.newText(numberBalloon, 0, 0, native.systemFont, 100)
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
		balloon.width = 230
		balloon.height = 250
		balloon.x = display.contentWidth - 50
		physics.addBody(balloon, {bounce = 0.5, radius = 100, friction = 1.0})
		balloon.myName = "balloon"
		
		balloon2 = display.newImage("images/pop2.png")
		balloon2.width = 230
		balloon2.height = 250
		balloon2.x = display.contentWidth - 300
		physics.addBody(balloon2, {bounce = 0.4, radius = 100, friction = 1.0})
		balloon2.myName = "balloon"

		balloon3 = display.newImage("images/pop3.png")
		balloon3.width = 230
		balloon3.height = 250
		balloon3.x = display.contentWidth - 550
		physics.addBody(balloon3, {bounce = 0.3, radius = 100, friction = 1.0})
		balloon3.myName = "balloon"

		balloon4 = display.newImage("images/pop4.png")
		balloon4.width = 230
		balloon4.height = 250
		balloon4.x = display.contentWidth - 800
		physics.addBody(balloon4, {bounce = 0.5, radius = 100, friction = 1.0})
		balloon4.myName = "balloon"

		balloon5 = display.newImage("images/pop5.png")
		balloon5.width = 230
		balloon5.height = 250
		balloon5.x = display.contentWidth - (-200)
		physics.addBody(balloon5, {bounce = 0.4, radius = 100, friction = 1.0})
		balloon5.myName = "balloon"
	end

	--[[
	local leftWall = display.newRect(0, 0, 1, display.contentHeight	)
	local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight	)
	local ceiling = display.newRect(0, 0, display.contentWidth, 1 )
	]]--

	--> Add Floor
	-- local floor = display.newImage("images/border.png", 100,50)
	-- floor.y = display.contentHeight - floor.stageHeight
	-- physics.addBody(floor, "static", {bounce = 0.0, friction = 1.0})

	local floor = display.newRect(0,0,1500,25)
	floor.x = display.contentWidth * 0.5
	floor.y = display.contentHeight - floor.stageHeight
	floor:setFillColor(0,0,0,1)
	physics.addBody(floor, "static", {bounce = 0.0, friction = 1.0})

	--> Touch Event Listener

	local function instructionFunction()
		local rand = math.random(1,5)

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
		else
			instruction.text = "Tap 5 balloons"
			total = 5
		end
	end

	function moveBalloon(event)
		local balloon = event.target
		balloon:applyLinearImpulse(0, -0.2, event.x, event.y)
	end

	function check()
		if total == numberBalloon then
			instruction.text = "Very Good!!"
			transition.to(balloon, {alpha = 0, time = 500})
			transition.to(balloon2, {alpha = 0, time = 500})
			transition.to(balloon3, {alpha = 0, time = 500})
			transition.to(balloon4, {alpha = 0, time = 500})
			transition.to(balloon5, {alpha = 0, time = 500}) 
			transition.to(replayButton, {alpha = 1, time = 500})
			transition.to(menuButton, {alpha = 1, time = 500})
			external.soundEffects("finish")
		end
	end

	function tapBalloon1()
		balloon:removeSelf()
		balloon.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	function tapBalloon2()
		balloon2:removeSelf()
		balloon2.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	function tapBalloon3()
		balloon3:removeSelf()
		balloon3.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	function tapBalloon4()
		balloon4:removeSelf()
		balloon4.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	function tapBalloon5()
		balloon5:removeSelf()
		balloon5.myName = nil
		numberBalloon = numberBalloon + 1
		number.text = numberBalloon
		check()
		external.soundEffects("pop")
	end	

	local function goToMenu()
		storyboard.gotoScene( "menu", "fade", 400 )
	end

	local function restartGame()
		numberBalloon = 0
		number.text = numberBalloon

		if balloon.myName ~= nil then
			balloon:removeSelf()
			balloon.myName = nil
		end
		if balloon2.myName ~= nil then
			balloon2:removeSelf()
			balloon2.myName = nil
		end
		if balloon3.myName ~= nil then
			balloon3:removeSelf()
			balloon3.myName = nil
		end
		if balloon4.myName ~= nil then
			balloon4:removeSelf()
			balloon4.myName = nil
		end
		if balloon5.myName ~= nil then
			balloon5:removeSelf()
			balloon5.myName = nil
		end
		instructionFunction()
		createBalloons()
		transition.to(menuButton, {alpha = 0, time = 300})
		transition.to(replayButton, {alpha = 0, time = 300})

		--Return listeners
		balloon:addEventListener("tap", tapBalloon1)
		balloon2:addEventListener("tap", tapBalloon2)
		balloon3:addEventListener("tap", tapBalloon3)
		balloon4:addEventListener("tap", tapBalloon4)
		balloon5:addEventListener("tap", tapBalloon5)
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

	screenGroup:insert(background)
	--screenGroup:insert(rainbow)
	screenGroup:insert(balloon)
	screenGroup:insert(balloon2)
	screenGroup:insert(balloon3)
	screenGroup:insert(balloon4)
	screenGroup:insert(balloon5)
	screenGroup:insert(instruction)
	screenGroup:insert(number)
	screenGroup:insert(floor)
	screenGroup:insert(replayButton)
	screenGroup:insert(menuButton)
end

function scene:exitScene( event )
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

