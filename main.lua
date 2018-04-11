-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Wendi Yu
-- Created on: Apr 2018
--
-- two object meet together and make some sounds. Then move away.
-----------------------------------------------------------------------------------------

math.randomseed( os.time() )
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

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
NinjiaGirl.x = 250
NinjiaGirl.y = display.contentHeight - 200 -- note I am using not the center but the height of the diaplay
NinjiaGirl.id = "Ninjia Girl"

local Dog = display.newImageRect("./assets/sprites/Dog.png", 500, 500)
Dog.x = 2048 
Dog.y = display.contentHeight - 200 -- note I am using not the center but the height of the diaplay
Dog.id = "Dog"


local function MoveImage(event)
	-- add the scroll speed to the x-value of the image
    local randomX = math.random ( -50, 50 ) 
    local randomY = math.random ( -50, 50 )
    print(randomX, randomY)

    NinjiaGirl.x = NinjiaGirl.x + randomX
    NinjiaGirl.y = NinjiaGirl.y + randomY
    Dog.x = Dog.x - scrollSpeed1
end

-- MoveNinjiaGirl will be called at program start over and over (60 frames or times per second)
Runtime:addEventListener("enterFrame", MoveImage)

