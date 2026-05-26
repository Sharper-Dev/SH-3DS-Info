local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("shc_builder")
local SHCDebugger = require("shc_debugger")

local debugText
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/bottom_background.png", 0, 0, 0)
    debugText = SHCBuilder.createText(canvasBottom, "dpb1", 5, 5, 1, "")
end

function MainBottomScreen.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    canvasBottom:draw()
end

return MainBottomScreen
