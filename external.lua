local external = {}

local prevScene = ""

function external.setPreviousScene(scene)
	prevScene = scene
end

function external.getPreviousScene()
	return prevScene
end

-- SOUNDS --
local bmusic = audio.loadStream("sounds/Upbeat Ukulele Background Music - Sunny Side Up by Alumo.mp3")
local popSound = audio.loadSound("sounds/pop.mp3")
local endSound = audio.loadSound("sounds/done.mp3")	
local page1 = audio.loadSound("story_telling/Upbeat Ukulele Background Music - Sunny Side Up by Alumo.mp3")

function external.playMusic()
    audio.play(bmusic, {channel = 0.5, loops = -1})
end

--STORY TELLING SOUND
function external.page1Sound()
	audio.play(page1, {channel = 1, loops = 0})
end

--END OF STORY TELLING SOUND

function external.soundEffects(type)
	audio.setVolume( 1, { channel=availableChannel } )
	if type == "pop" then
		local availableChannel = audio.findFreeChannel()
        audio.setVolume( 1, { channel=availableChannel } )
        audio.play(popSound, {channel=availableChannel})
	elseif type == "finish" then
		local availableChannel2 = audio.findFreeChannel()
        audio.setVolume( 1, { channel=availableChannel2 } )
        audio.play(endSound, {channel=availableChannel2})
	end
end

return external