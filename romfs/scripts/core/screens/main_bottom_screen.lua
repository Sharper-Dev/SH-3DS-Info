local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCImage = require("shc_image")

local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local bottomBackground = SHCImage:new("romfs:/images/bottom_background.png")

function MainBottomScreen.setup()
    canvasBottom:addCanvasComponent(bottomBackground)
end

function MainBottomScreen.draw()
    canvasBottom:draw()
end

return MainBottomScreen
