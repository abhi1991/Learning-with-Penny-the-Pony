local external = {}

-- SOUNDS --
local bmusic = audio.loadStream("sounds/Upbeat Ukulele Background Music - Sunny Side Up by Alumo.mp3")
local popSound = audio.loadSound("sounds/pop.mp3")
local endSound = audio.loadSound("sounds/done.mp3")	

function external.playMusic()
    audio.play(bmusic, {channel = 1, loops = -1})
end

function external.soundEffects(type)
	audio.setVolume( 1, { channel=availableChannel } )
	if type == "pop" then
		audio.play(popSound)
	elseif type == "finish" then
		audio.play(endSound)
	end
end

return external