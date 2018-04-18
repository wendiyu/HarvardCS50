-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Wendi Yu
-- Created on: Apr 2018
--
-- two object meet together and make some sounds. Then move away.
-----------------------------------------------------------------------------------------

-- start sound
soundStarted = false   
local soundEffect = audio.loadSound( "./assets/audio/hit.wav" )

math.randomseed( os.time() )
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Start Physics
 local physics = require("physics")
 physics.start()

-- local variables to this entire file
local scrollSpeed = 5
local scrollSpeed1 = 4

-- background image with width and height
local backgroundImage = display.newImageRect("./assets/textures/background.png", 2048, 1536)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY
backgroundImage.id = "winter background image"

-- character image with width and height
local NinjiaGirl = display.newImageRect("./assets/sprites/Ninjia.png", 500, 500)
NinjiaGirl.x = 50
NinjiaGirl.y = display.contentHeight - 1100 -- note I am using not the center but the height of the diaplay
NinjiaGirl.id = "Ninjia Girl"

local Dog = display.newImageRect("./assets/sprites/Dog.png", 500, 500)
Dog.x = 2048 
Dog.y = display.contentHeight - 320 -- note I am using not the center but the height of the diaplay
Dog.id = "Dog"


local function MoveImage(event)
	-- add the scroll speed to the x-value of the image

	local randomX = math.random ( 1, 20 ) 
	local randomY = math.random ( 0, 10 )
	print(randomX, randomY)

	NinjiaGirl.x = NinjiaGirl.x + randomX
	NinjiaGirl.y = NinjiaGirl.y + randomY
	Dog.x = Dog.x - scrollSpeed1

	local randomX = math.random ( -50, 50 ) 
	local randomY = math.random ( -50, 50 )
	print(randomX, randomY)

	NinjiaGirl.x = NinjiaGirl.x + randomX
	NinjiaGirl.y = NinjiaGirl.y + randomY
	Dog.x = Dog.x - scrollSpeed1

	if  NinjiaGirl.x >= Dog.x then
		if soundStarted == false then
			audio.play( soundEffect )
			soundStarted = true
		end
	end
end

-- MoveNinjiaGirl will be called at program start over and over (60 frames or times per second)
Runtime:addEventListener("enterFrame", MoveImage)
