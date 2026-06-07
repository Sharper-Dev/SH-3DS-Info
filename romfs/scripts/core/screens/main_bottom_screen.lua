local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")

local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local debugText

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/bottom_background.png", 0, 0, 0)
    debugText = SHCBuilder.createText(canvasBottom, "dpb1", 1, 10, 10, 1, "")
end

function MainBottomScreen.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    canvasBottom:draw()
end

return MainBottomScreen
