display.setStatusBar( display.HiddenStatusBar )

local storyboard = require "storyboard"
require "sqlite3"
-- local external = require("external")

-- This collects unused memory
local function checkmem()
    collectgarbage()
end

timer.performWithDelay(3000, checkmem, 0)

-- storyboard.gotoScene( "splash", "fade", 400 )
storyboard.gotoScene( "colorMatching", "fade", 400 )


