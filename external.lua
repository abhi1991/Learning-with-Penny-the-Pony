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
local page1 = audio.loadSound("story_telling/page1.mp3")
local page2 = audio.loadSound("story_telling/page2.mp3")
local page3 = audio.loadSound("story_telling/page3.mp3")
local page4 = audio.loadSound("story_telling/page4.mp3")
local page5 = audio.loadSound("story_telling/page5.mp3")
local lastPage = audio.loadSound("story_telling/lastPage.mp3")


function external.playMusic()
    audio.play(bmusic, {channel = 0.5, loops = -1})
end

--STORY TELLING SOUND
function external.page1Sound()
	audio.play(page1, {channel = 5, loops = 0})
end

function external.page2Sound()
	audio.play(page2, {channel = 5, loops = 0})
end

function external.page3Sound()
	audio.play(page3, {channel = 5, loops = 0})
end

function external.page4Sound()
	audio.play(page4, {channel = 5, loops = 0})
end

function external.page5Sound()
	audio.play(page5, {channel = 5, loops = 0})
end

function external.lastPageSound()
	audio.play(lastPage, {channel = 5, loops = 0})
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