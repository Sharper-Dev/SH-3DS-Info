local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")
local InputSystem = require("lpp_input_system")
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local debugText
local targetImage
local pressedButtonImage
local touchPosition
local buttonImages = {}

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/bottom_background.png", 0, 0, 0)
    pressedButtonImage = Graphics.loadImage("romfs:/images/button_pressed.png")
    debugText = SHCBuilder.createText(canvasBottom, "dogica_16px", 1, 87, 113, 1, "")
    targetImage = SHCBuilder.createImage(canvasBottom, "romfs:/images/target.png", 0, 0, 2)
    targetImage.isVisible = false
    buttonImages[1] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_a.png", 292, 119, 2)
    buttonImages[1].originalImage = buttonImages[1].image
    buttonImages[2] = SHCBuilder.createImage(canvasBottom, "romfs:/images/button_b.png", 267, 144, 2)
    buttonImages[2].originalImage = buttonImages[2].image
    
    SHCBuilder.createText(canvasBottom, "dogica_16px", 0.8, 79, 9, 1, "Test your input!")
    SHCBuilder.createText(canvasBottom, "dogica_8px", 1, 105, 227, 1, "Made by Sharper Dev")
    SHCBuilder.createText(canvasBottom, "dogica_8px", 1, 54, 236, 1, "Lua Player Plus by Rinnegatamante")

end

function MainBottomScreen.update()
    SHCDebugger.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    targetImage.isVisible = InputSystem.getKey(KEY_TOUCH)
    touchPosition = InputSystem.getTouch()
    -- 7 is the offset to make the target image centered on the touch position
    targetImage.transform:setPosition(touchPosition.x - 7, touchPosition.y - 7)
    for i, buttonImage in ipairs(buttonImages) do
        local key = 2 ^ (i - 1)
        local pressed = InputSystem.getKey(key)
        buttonImage.image = pressed and pressedButtonImage or buttonImage.originalImage
    end
    canvasBottom:draw()
end

return MainBottomScreen
