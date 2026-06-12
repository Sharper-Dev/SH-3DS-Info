local MainBottomScreen = {}

local MainBottomDesign = require("core.screens.design.main_bottom_design")

local InputSystem = require("lpp_input_system")

local maxPadDistance = 0.15
local maxCstickDistance = 0.1

local touchPosition

function MainBottomScreen.setup()
    MainBottomDesign.setup()
end

function MainBottomScreen.update()
    local cx, cy = InputSystem.getCirclePad()
    MainBottomDesign.components["circlepad"].transform:setPosition(MainBottomDesign.components["circlepad"].start.x + cx * maxPadDistance, MainBottomDesign.components["circlepad"].start.y - cy * maxPadDistance)
    
    cx, cy = InputSystem.getCstick()
    MainBottomDesign.components["cstick"].transform:setPosition(MainBottomDesign.components["cstick"].start.x + cx * maxCstickDistance, MainBottomDesign.components["cstick"].start.y - cy * maxCstickDistance)
    
    MainBottomDesign.components["targetImage"].isVisible = InputSystem.getKey(KEY_TOUCH)
    touchPosition = InputSystem.getTouch()
    -- 7 is the offset to make the target image centered on the touch position
    MainBottomDesign.components["targetImage"].transform:setPosition(touchPosition.x - 7, touchPosition.y - 7)
    
    for i, buttonImage in pairs(MainBottomDesign.components["buttonImages"]) do
        local key = 2 ^ (i - 1)
        local pressed = InputSystem.getKey(key)
        
        buttonImage.image = pressed and MainBottomDesign.components["pressedImages"][buttonImage.pressedImageIndex] or buttonImage.originalImage
    end
    
    MainBottomDesign.canvas:draw()
end

return MainBottomScreen
