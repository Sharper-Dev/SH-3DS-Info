local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCImage = require("shc_image")
local SHCDebugger = require("shc_debugger")
local SHCText = require("shc_text")

local debugText
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local bottomBackground = SHCImage:new("romfs:/images/bottom_background.png")

function MainBottomScreen.setup()
    debugText = SHCText.createQuickText(canvasBottom, "dpb1", 5, 5, 1, "")
    canvasBottom:addCanvasComponent(bottomBackground)
    canvasBottom:addCanvasComponent(debugText)
end

function MainBottomScreen.update()
    debugText:setContent(SHCDebugger.getDebugContent())
    canvasBottom:draw()
end

return MainBottomScreen
