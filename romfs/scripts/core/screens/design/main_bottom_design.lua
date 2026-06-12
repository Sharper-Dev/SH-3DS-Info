local MainBottomDesign = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local ButtonsData = require("core.data.buttons_data")

local circlePadStart = { x = 20, y = 76 }
local cstickStart = { x = 219, y = 59 }

MainBottomDesign.components = {}

function MainBottomDesign.setup()
    MainBottomDesign.canvas = SHCanvas:new(BOTTOM_SCREEN)
    SHCBuilder.createImage(MainBottomDesign.canvas, "romfs:/images/b_back.png", 0, 0, 0)
    
    MainBottomDesign.components["circlepad"] = SHCBuilder.createImage(MainBottomDesign.canvas, "romfs:/images/circlepad.png", circlePadStart.x, circlePadStart.y, 2)
    MainBottomDesign.components["circlepad"].start = circlePadStart

    MainBottomDesign.components["cstick"] = SHCBuilder.createImage(MainBottomDesign.canvas, "romfs:/images/cstick.png", cstickStart.x, cstickStart.y, 2)
    MainBottomDesign.components["cstick"].start = cstickStart
    
    local pressedImages = {}
    local pressedList = {"button", "select", "start", "pad", "rl", "zrl"}
    for i, pressed in ipairs(pressedList) do
        pressedImages[i] = Graphics.loadImage("romfs:/images/" .. pressed .. "_pressed.png")
    end
    
    MainBottomDesign.components["pressedImages"] = pressedImages
    MainBottomDesign.components["targetImage"] = SHCBuilder.createImage(MainBottomDesign.canvas, "romfs:/images/target.png", 0, 0, 2)
    MainBottomDesign.components["targetImage"].isVisible = false

    local buttonImages = {}
    for i, buttonData in pairs(ButtonsData) do
        buttonImages[i] = SHCBuilder.createImage(MainBottomDesign.canvas, "romfs:/images/button_" .. buttonData.button .. ".png", buttonData.x, buttonData.y, 2)
        buttonImages[i].originalImage = buttonImages[i].image
        buttonImages[i].pressedImageIndex = buttonData.pressedIndex
    end
    MainBottomDesign.components["buttonImages"] = buttonImages

    SHCBuilder.createText(MainBottomDesign.canvas, "dogica_16px", 0.8, 79, 9, 1, "Test your input!")
    SHCBuilder.createText(MainBottomDesign.canvas, "dogica_8px", 1, 105, 227, 1, "Made by Sharper Dev")
    SHCBuilder.createText(MainBottomDesign.canvas, "dogica_8px", 1, 54, 236, 1, "Lua Player Plus by Rinnegatamante")
end

return MainBottomDesign