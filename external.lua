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
local page1 = audio.loadSound("story_telling/story/firstPage.mp3")
local page2 = audio.loadSound("story_telling/story/secondPage.mp3")
local page3 = audio.loadSound("story_telling/story/thirdPage.mp3")
local page4 = audio.loadSound("story_telling/story/fourthPage.mp3")
local page5 = audio.loadSound("story_telling/story/fifthPage.mp3")
local lastPage = audio.loadSound("story_telling/story/lastPage.mp3")
local pahina1 = audio.loadSound("story_telling/story/una.mp3")
local pahina2 = audio.loadSound("story_telling/story/Pangalawa.mp3")
local pahina3 = audio.loadSound("story_telling/story/ikatlo.mp3")
local pahina4 = audio.loadSound("story_telling/story/ikaapat.mp3")
local pahina5 = audio.loadSound("story_telling/story/ikalima.mp3")
local huli = audio.loadSound("story_telling/story/huli.mp3")
local correct = audio.loadSound("Sounds/Correct.mp3")
local wrong = audio.loadSound("Sounds/Wrong.mp3")

function external.playMusic()
    audio.play(bmusic, {channel = 0.5, loops = -1})
end

function external.pauseMusic()
	audio.pause(bmusic, {channel = 0.5, loops = -1})
end

function external.resumeMusic()
	audio.resume(bmusic, {channel = 0.5, loops = -1})
end

--STORY TELLING SOUND
--english
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

--tagalog
	function external.pahina1Sound()
		audio.play(pahina1, {channel = 5, loops = 0})
	end

	function external.pahina2Sound()
		audio.play(pahina2, {channel = 5, loops = 0})
	end

	function external.pahina3Sound()
		audio.play(pahina3, {channel = 5, loops = 0})
	end

	function external.pahina4Sound()
		audio.play(pahina4, {channel = 5, loops = 0})
	end

	function external.pahina5Sound()
		audio.play(pahina5, {channel = 5, loops = 0})
	end

	function external.hulingSound()
		audio.play(huli, {channel = 5, loops = 0})
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

function external.correctionEffects(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "correct" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( correct, { channel=availableChannel})
	elseif type == "wrong" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( wrong, { channel=availableChannel2})
	end
end


return external