local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")

local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local debugText

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/bottom_background.png", 0, 0, 0)
    debugText = SHCBuilder.createText(canvasBottom, "dogicapixelbmf", 1, 87, 113, 1, "")

    SHCBuilder.createText(canvasBottom, "dogicapixelbmf", 0.8, 79, 9, 1, "Test your input!")
    SHCBuilder.createText(canvasBottom, "dogicapixelbmf", 0.45, 105, 227, 1, "Made by Sharper Dev")
    SHCBuilder.createText(canvasBottom, "dogicapixelbmf", 0.45, 59, 236, 1, "Lua Player Plus by Rinnegatamante")
    
end

function MainBottomScreen.update()
    SHCDebugger.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    canvasBottom:draw()
end

return MainBottomScreen
