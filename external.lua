local external = {}

local prevScene = ""

function external.setPreviousScene(scene)
	prevScene = scene
end

function external.getPreviousScene()
	return prevScene
end

-- MUSIC AND SOUND EFFECTS --
local bmusic = audio.loadStream("sounds/Upbeat Ukulele Background Music - Sunny Side Up by Alumo.mp3")
local popSound = audio.loadSound("sounds/pop.mp3")
local endSound = audio.loadSound("sounds/done.mp3")	
local page1 = audio.loadSound("story_telling/story/page1.mp3")
local page2 = audio.loadSound("story_telling/story/page2.mp3")
local page3 = audio.loadSound("story_telling/story/page3.mp3")
local page4 = audio.loadSound("story_telling/story/page4.mp3")
local page5 = audio.loadSound("story_telling/story/page5.mp3")
local lastPage = audio.loadSound("story_telling/story/page6.mp3")
local pahina1 = audio.loadSound("story_telling/story/pahina1.mp3")
local pahina2 = audio.loadSound("story_telling/story/pahina2.mp3")
local pahina3 = audio.loadSound("story_telling/story/pahina3.mp3")
local pahina4 = audio.loadSound("story_telling/story/pahina4.mp3")
local pahina5 = audio.loadSound("story_telling/story/pahina5.mp3")
local huli = audio.loadSound("story_telling/story/pahina6.mp3")
local correct = audio.loadSound("sounds/Correct.mp3")
local wrong = audio.loadSound("sounds/Wrong.mp3")
local yehey = audio.loadSound("sounds/success.mp3")
local feedCorrect = audio.loadSound("sounds/feedbackCorrect.mp3")
local feedWrong = audio.loadSound("sounds/feedbackWrong.mp3")
local mali = audio.loadSound("sounds/mali.mp3")
local tama = audio.loadSound("sounds/tama.mp3")
local tapBig = audio.loadSound("sounds/tapBig.mp3")
local tapSmall = audio.loadSound("sounds/tapSmall.mp3")
local gemsEnglish = audio.loadSound("sounds/howGems.mp3")
local gemsTagalog = audio.loadSound("sounds/gemsTagalog.mp3")
local malaki = audio.loadSound("sounds/hayopMalaki.mp3")
local maliit = audio.loadSound("sounds/hayopMaliit.mp3")

--Instruction English
local instructalphabetEng = audio.loadSound("sounds/instructions/eng_alphabet.mp3")
local instructcolorEng = audio.loadSound("sounds/instructions/eng_color.mp3")
local instructsizeEng = audio.loadSound("sounds/instructions/eng_size.mp3")
local instructshapesEng = audio.loadSound("sounds/instructions/eng_shape.mp3")
local instructballoonEng = audio.loadSound("sounds/instructions/eng_balloon.mp3")
local instructnumEng = audio.loadSound("sounds/instructions/eng_num.mp3")
-- Instruction Tagalog
local instructalphabetTag = audio.loadSound("sounds/instructions/tagalog_alphabet.mp3")
local instructcolorTag = audio.loadSound("sounds/instructions/tagalog_color.mp3")
local instructsizeTag = audio.loadSound("sounds/instructions/tagalog_size.mp3")
local instructshapesTag = audio.loadSound("sounds/instructions/tagalog_shape.mp3")
local instructballoonTag = audio.loadSound("sounds/instructions/tagalog_balloon.mp3")
local instructnumTag = audio.loadSound("sounds/instructions/tagalog_num.mp3")



-- Background Music --
--  function external.controlMusic(control)
--     if control == "play" then
--         audio.play(bmusic, {channel = 1, loops = -1})
--     elseif control == "pause" then
--         withSounds = false
--         audio.pause(bmusic)
--     elseif control == "resume" then
--         withSounds = true
--         audio.resume(bmusic)
--     end
-- end

-- Background Music --
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

-- PAGE 1 --
	function external.page1Sound()
		audio.play(page1, {channel = 5, loops = 0})
	end

	function external.pauseMusicpage1Sound()
	audio.pause(page1, {channel = 0.5, loops = -1})
	end

	function external.resumeMusicpage1Sound()
		audio.resume(page1, {channel = 0.5, loops = -1})
	end

-- PAGE 2 --
	function external.page2Sound()
		audio.play(page2, {channel = 5, loops = 0})
	end
	
	function external.pauseMusicpage2Sound()
	audio.pause(page2, {channel = 0.5, loops = -1})
	end

	function external.resumeMusicpage2Sound()
		audio.resume(page2, {channel = 0.5, loops = -1})
	end

-- PAGE 3 --
	function external.page3Sound()
		audio.play(page3, {channel = 5, loops = 0})
	end
	function external.pauseMusicpage3Sound()
	audio.pause(page3, {channel = 0.5, loops = -1})
	end

	function external.resumeMusicpage3Sound()
		audio.resume(page3, {channel = 0.5, loops = -1})
	end

-- PAGE 4 --
	function external.page4Sound()
		audio.play(page4, {channel = 5, loops = 0})
	end
	
	function external.pauseMusicpage4Sound()
	audio.pause(page4, {channel = 0.5, loops = -1})
	end

	function external.resumeMusicpage4Sound()
		audio.resume(page4, {channel = 0.5, loops = -1})
	end

-- PAGE 5 --
	function external.page5Sound()
		audio.play(page5, {channel = 5, loops = 0})
	end
	
	function external.pauseMusicpage5Sound()
	audio.pause(page5, {channel = 0.5, loops = -1})
	end

	function external.resumeMusicpage5Sound()
		audio.resume(page5, {channel = 0.5, loops = -1})
	end

-- PAGE 6 --
	function external.lastPageSound()
		audio.play(lastPage, {channel = 5, loops = 0})
	end

function external.pauseMusiclastPageSound()
	audio.pause(lastPage, {channel = 0.5, loops = -1})
end

function external.resumeMusiclastPageSound()
	audio.resume(lastPage, {channel = 0.5, loops = -1})
end
	

--tagalog
-- PAHINA 1 --
	function external.pahina1Sound()
		audio.play(pahina1, {channel = 5, loops = 0})
	end
	function external.pahina1SoundStop()
		audio.stop(pahina1, {channel = 5, loops = 0})
	end

-- PAHINA 2 --
	function external.pahina2Sound()
		audio.play(pahina2, {channel = 5, loops = 0})
	end
	function external.pahina2SoundStop()
		audio.stop(pahina2, {channel = 5, loops = 0})
	end

--PAHINA 3 --
	function external.pahina3Sound()
		audio.play(pahina3, {channel = 5, loops = 0})
	end
	function external.pahina3SoundStop()
		audio.stop(pahina3, {channel = 5, loops = 0})
	end

-- PAHINA 4 --
	function external.pahina4Sound()
		audio.play(pahina4, {channel = 5, loops = 0})
	end
	function external.pahina4SoundStop()
		audio.stop(pahina4, {channel = 5, loops = 0})
	end

-- PAHINA 5 --
	function external.pahina5Sound()
		audio.play(pahina5, {channel = 5, loops = 0})
	end
	function external.pahina4SoundStop()
		audio.stop(pahina5, {channel = 5, loops = 0})
	end

-- PAHINA 6 --
	function external.hulingSound()
		audio.play(huli, {channel = 5, loops = 0})
	end
	function external.pahina4SoundStop()
		audio.stop(huli, {channel = 5, loops = 0})
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

function external.gems(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "gemsEng" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( gemsEnglish, { channel=availableChannel})
	elseif type == "gemsTag" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( gemsTagalog, { channel=availableChannel2})
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
	elseif type == "yehey" then
		local availableChannel3 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel3})
		audio.play( yehey, { channel=availableChannel3})
	end
end

function external.intruct(type)
	if type == "engColor" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play(instructcolorEng, { channel=availableChannel})
	elseif type == "engSize" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructsizeEng, { channel=availableChannel})
	elseif type == "engShape" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructshapesEng, { channel=availableChannel})
	elseif type == "engCount" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructnumEng, { channel=availableChannel})
	elseif type == "engBalloon" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructballoonEng, { channel=availableChannel})
	elseif type == "engAlphabet" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructalphabetEng, { channel=availableChannel})

	
	elseif type == "tagSize" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructsizeTag, { channel=availableChannel})
	elseif type == "tagAlphabet" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructalphabetTag, { channel=availableChannel})
	elseif type == "tagCount" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructnumTag, { channel=availableChannel})
	elseif type == "tagColor" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructcolorTag, { channel=availableChannel})
	elseif type == "tagShape" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructshapesTag, { channel=availableChannel})
	elseif type == "tagBalloon" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( instructballoonTag, { channel=availableChannel})


	end
end

--FEEDBACKS
function external.feeds(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "correctFeed" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( feedCorrect, { channel=availableChannel})
	elseif type == "wrongFeed" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( feedWrong, { channel=availableChannel2})
	elseif type == "big" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tapBig, { channel=availableChannel2})
	elseif type == "small" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tapSmall, { channel=availableChannel2})
	elseif type == "tama" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tama, { channel=availableChannel2})
	elseif type == "mali" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( mali, { channel=availableChannel2})
	elseif type == "maliit" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( maliit, { channel=availableChannel2})
	elseif type == "malaki" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( malaki, { channel=availableChannel2})
	end
end

--COLORS
local red = audio.loadSound("sounds/colors/red.mp3")
local orange = audio.loadSound("sounds/colors/orange.mp3")
local yellow = audio.loadSound("sounds/colors/yellow.mp3")
local green = audio.loadSound("sounds/colors/green.mp3")
local blue = audio.loadSound("sounds/colors/blue.mp3")
local purple = audio.loadSound("sounds/colors/purple.mp3")
local black = audio.loadSound("sounds/colors/black.mp3")
local white = audio.loadSound("sounds/colors/white.mp3")
local pink = audio.loadSound("sounds/colors/pink.mp3")
local brown = audio.loadSound("sounds/colors/brown.mp3")
local lila = audio.loadSound("sounds/colors/lila.mp3")
local asul = audio.loadSound("sounds/colors/asul.mp3")
local pula = audio.loadSound("sounds/colors/pula.mp3")
local berde = audio.loadSound("sounds/colors/berde.mp3")
local kahel = audio.loadSound("sounds/colors/kahel.mp3")
local dilaw = audio.loadSound("sounds/colors/dilaw.mp3")
local itim = audio.loadSound("sounds/colors/itim.mp3")
local kayumanggi = audio.loadSound("sounds/colors/kayumanggi.mp3")
local puti = audio.loadSound("sounds/colors/puti.mp3")
local roses = audio.loadSound("sounds/colors/roses.mp3")

--COLORS EXTERNAL
function external.color(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "red" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( red, { channel=availableChannel})
	elseif type == "orange" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( orange, { channel=availableChannel2})
	elseif type == "yellow" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( yellow, { channel=availableChannel2})
	elseif type == "green" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( green, { channel=availableChannel2})
	elseif type == "blue" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( blue, { channel=availableChannel2})
	elseif type == "purple" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( purple, { channel=availableChannel2})
	elseif type == "black" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( black, { channel=availableChannel2})
	elseif type == "white" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( white, { channel=availableChannel})
	elseif type == "brown" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( brown, { channel=availableChannel2})
	elseif type == "pink" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( pink, { channel=availableChannel2})
	elseif type == "pula" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( pula, { channel=availableChannel})
	elseif type == "kahel" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( kahel, { channel=availableChannel2})
	elseif type == "dilaw" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( dilaw, { channel=availableChannel2})
	elseif type == "berde" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( berde, { channel=availableChannel2})
	elseif type == "asul" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( asul, { channel=availableChannel2})
	elseif type == "lila" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( lila, { channel=availableChannel2})
	elseif type == "itim" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( itim, { channel=availableChannel})
	elseif type == "puti" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( puti, { channel=availableChannel2})
	elseif type == "kayumanggi" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( kayumanggi, { channel=availableChannel2})
	elseif type == "rosas" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( rosas, { channel=availableChannel2})
	end
end



--SHAPES
local star = audio.loadSound("sounds/shapes/star.mp3")
local circle = audio.loadSound("sounds/shapes/circle.mp3")
local square = audio.loadSound("sounds/shapes/square.mp3")
local rectangle = audio.loadSound("sounds/shapes/rectangle.mp3")
local oblong = audio.loadSound("sounds/shapes/oblong.mp3")
local triangle = audio.loadSound("sounds/shapes/triangle.mp3")
local bilog = audio.loadSound("sounds/shapes/bilog.mp3")
local bituin = audio.loadSound("sounds/shapes/bituin.mp3")
local habilog = audio.loadSound("sounds/shapes/habilog.mp3")
local parihaba = audio.loadSound("sounds/shapes/parihaba.mp3")
local parisukat = audio.loadSound("sounds/shapes/parisukat.mp3")
local tatsulok = audio.loadSound("sounds/shapes/tatsulok.mp3")

--SHAPES EXTERNAL
function external.shape(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "star" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( star, { channel=availableChannel})
	elseif type == "circle" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( circle, { channel=availableChannel2})
	elseif type == "square" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( square, { channel=availableChannel2})
	elseif type == "rectangle" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( rectangle, { channel=availableChannel2})
	elseif type == "oblong" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( oblong, { channel=availableChannel2})
	elseif type == "triangle" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( triangle, { channel=availableChannel2})
	elseif type == "bilog" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( bilog, { channel=availableChannel})
	elseif type == "bituin" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( bituin, { channel=availableChannel2})
	elseif type == "habilog" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( habilog, { channel=availableChannel2})
	elseif type == "parihaba" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( parihaba, { channel=availableChannel2})
	elseif type == "parisukat" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( parisukat, { channel=availableChannel2})
	elseif type == "tatsulok" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tatsulok, { channel=availableChannel2})
	
	end
end



--NUMBERS
local one = audio.loadSound("sounds/numbers/1.mp3")
local two = audio.loadSound("sounds/numbers/2.mp3")
local three = audio.loadSound("sounds/numbers/3.mp3")
local four = audio.loadSound("sounds/numbers/4.mp3")
local five = audio.loadSound("sounds/numbers/5.mp3")
local six = audio.loadSound("sounds/numbers/6.mp3")
local seven = audio.loadSound("sounds/numbers/7.mp3")
local eight = audio.loadSound("sounds/numbers/8.mp3")
local nine = audio.loadSound("sounds/numbers/9.mp3")
local ten = audio.loadSound("sounds/numbers/10.mp3")
local tone = audio.loadSound("sounds/numbers/t1.mp3")
local ttwo = audio.loadSound("sounds/numbers/t2.mp3")
local tthree = audio.loadSound("sounds/numbers/t3.mp3")
local tfour = audio.loadSound("sounds/numbers/t4.mp3")
local tfive = audio.loadSound("sounds/numbers/t5.mp3")
local tsix = audio.loadSound("sounds/numbers/t6.mp3")
local tseven = audio.loadSound("sounds/numbers/t7.mp3")
local teight = audio.loadSound("sounds/numbers/t8.mp3")
local tnine = audio.loadSound("sounds/numbers/t9.mp3")
local tten = audio.loadSound("sounds/numbers/t10.mp3")

--NUMBERS EXTERNAL
function external.number(type)
	audio.setVolume(1, { channel=availableChannel })
	if type == "one" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( one, { channel=availableChannel})
	elseif type == "two" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( two, { channel=availableChannel2})
	elseif type == "three" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( three, { channel=availableChannel2})
	elseif type == "four" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( four, { channel=availableChannel2})
	elseif type == "five" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( five, { channel=availableChannel2})
	elseif type == "six" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( six, { channel=availableChannel2})
	elseif type == "seven" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( seven, { channel=availableChannel})
	elseif type == "eight" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( eight, { channel=availableChannel2})
	elseif type == "nine" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( nine, { channel=availableChannel2})
	elseif type == "ten" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( ten, { channel=availableChannel2})
	elseif type == "tone" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( tone, { channel=availableChannel})
	elseif type == "ttwo" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( ttwo, { channel=availableChannel2})
	elseif type == "tthree" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tthree, { channel=availableChannel2})
	elseif type == "tfour" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( four, { channel=availableChannel2})
	elseif type == "tfive" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tfive, { channel=availableChannel2})
	elseif type == "tsix" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tsix, { channel=availableChannel2})
	elseif type == "tseven" then
		local availableChannel = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel})
		audio.play( tseven, { channel=availableChannel})
	elseif type == "teight" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( teight, { channel=availableChannel2})
	elseif type == "tnine" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tnine, { channel=availableChannel2})
	elseif type == "tten" then
		local availableChannel2 = audio.findFreeChannel()
		audio.setVolume( 1, { channel=availableChannel2})
		audio.play( tten, { channel=availableChannel2})
	
	end
end


return external