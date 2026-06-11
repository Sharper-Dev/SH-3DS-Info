local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")
local InputSystem = require("lpp_input_system")
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local debugText
local targetImage
local pressedList = {"button", "select", "start", "pad", "rl", "zrl"}
local pressedImages = {}
local touchPosition
local buttonImages = {}
local circlePadImage
local cstickImage
local circlePadStart = { x = 20, y = 76 }
local cstickStart = { x = 219, y = 59 }
local maxPadDistance = 0.15
local maxCstickDistance = 0.1

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/b_back.png", 0, 0, 0)
    circlePadImage = SHCBuilder.createImage(canvasBottom, "romfs:/images/circlepad.png", circlePadStart.x, circlePadStart.y, 2)
    cstickImage = SHCBuilder.createImage(canvasBottom, "romfs:/images/cstick.png", cstickStart.x, cstickStart.y, 2)
    
    for i, pressed in ipairs(pressedList) do
        pressedImages[i] = Graphics.loadImage("romfs:/images/" .. pressed .. "_pressed.png")
    end  
    targetImage = SHCBuilder.createImage(canvasBottom, "romfs:/images/target.png", 0, 0, 2)
    targetImage.isVisible = false
    
    -- TODO: REFACTOR THIS PLEASE
    buttonImages[1] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_a.png", 292, 119, 2)
    buttonImages[1].originalImage = buttonImages[1].image
    buttonImages[1].pressedImageIndex = 1
    
    buttonImages[2] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_b.png", 267, 144, 2)
    buttonImages[2].originalImage = buttonImages[2].image
    buttonImages[2].pressedImageIndex = 1

    buttonImages[3] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_select.png", 82, 207, 2)
    buttonImages[3].originalImage = buttonImages[3].image
    buttonImages[3].pressedImageIndex = 2

    buttonImages[4] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_start.png", 192, 207, 2)
    buttonImages[4].originalImage = buttonImages[4].image
    buttonImages[4].pressedImageIndex = 3

    buttonImages[5] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_pad.png", 47, 163, 2)
    buttonImages[5].originalImage = buttonImages[5].image
    buttonImages[5].pressedImageIndex = 4

    buttonImages[6] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_pad.png", 7, 163, 2)
    buttonImages[6].originalImage = buttonImages[6].image
    buttonImages[6].pressedImageIndex = 4

    buttonImages[7] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_pad.png", 27, 143, 2)
    buttonImages[7].originalImage = buttonImages[7].image
    buttonImages[7].pressedImageIndex = 4

    buttonImages[8] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_pad.png", 27, 183, 2)
    buttonImages[8].originalImage = buttonImages[8].image
    buttonImages[8].pressedImageIndex = 4

    buttonImages[9] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_r.png", 256, 20, 2)
    buttonImages[9].originalImage = buttonImages[9].image
    buttonImages[9].pressedImageIndex = 5

    buttonImages[10] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_l.png", 2, 20, 2)
    buttonImages[10].originalImage = buttonImages[10].image
    buttonImages[10].pressedImageIndex = 5

    buttonImages[11] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_x.png", 267, 94, 2)
    buttonImages[11].originalImage = buttonImages[11].image
    buttonImages[11].pressedImageIndex = 1

    buttonImages[12] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_y.png", 242, 119, 2)
    buttonImages[12].originalImage = buttonImages[12].image
    buttonImages[12].pressedImageIndex = 1

    buttonImages[15] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_zl.png", 68, 20, 2)
    buttonImages[15].originalImage = buttonImages[15].image
    buttonImages[15].pressedImageIndex = 6

    buttonImages[16] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_zr.png", 204, 20, 2)
    buttonImages[16].originalImage = buttonImages[16].image
    buttonImages[16].pressedImageIndex = 6
    
    debugText = SHCBuilder.createText(canvasBottom, "dogica_16px", 1, 87, 113, 1, "")
    SHCBuilder.createText(canvasBottom, "dogica_16px", 0.8, 79, 9, 1, "Test your input!")
    SHCBuilder.createText(canvasBottom, "dogica_8px", 1, 105, 227, 1, "Made by Sharper Dev")
    SHCBuilder.createText(canvasBottom, "dogica_8px", 1, 54, 236, 1, "Lua Player Plus by Rinnegatamante")
end

function MainBottomScreen.update()
    SHCDebugger.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    
    local cx, cy = InputSystem.getCirclePad()
    circlePadImage.transform:setPosition(circlePadStart.x + cx * maxPadDistance, circlePadStart.y - cy * maxPadDistance)
    
    cx, cy = InputSystem.getCstick()
    cstickImage.transform:setPosition(cstickStart.x + cx * maxCstickDistance, cstickStart.y - cy * maxCstickDistance)
    
    targetImage.isVisible = InputSystem.getKey(KEY_TOUCH)
    touchPosition = InputSystem.getTouch()
    -- 7 is the offset to make the target image centered on the touch position
    targetImage.transform:setPosition(touchPosition.x - 7, touchPosition.y - 7)
    
    for i, buttonImage in pairs(buttonImages) do
        local key = 2 ^ (i - 1)
        local pressed = InputSystem.getKey(key)
        buttonImage.image = pressed and pressedImages[buttonImage.pressedImageIndex] or buttonImage.originalImage
    end
    
    canvasBottom:draw()
end

return MainBottomScreen
