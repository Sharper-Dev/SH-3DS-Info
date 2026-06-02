local MainBottomScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")
local SHCFonts = require("sh_canvas.shc_fonts")
local utf8 = require("utf8")

local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)

function MainBottomScreen.setup()
    SHCBuilder.createImage(canvasBottom, "romfs:/images/bottom_background.png", 0, 0, 0)
end

function MainBottomScreen.update()
    canvasBottom:draw()
    local text = "abé"
    Graphics.initBlend(BOTTOM_SCREEN)
    local position = { x = 100, y = 100 }
    local cursor = { x = position.x, y = position.y }

    for _, code in utf8.codes(text) do
        local charInfo = SHCFonts.getBMFont().data.chars[code]
        if charInfo then
            cursor.x = cursor.x + charInfo.xoffset
            cursor.y = cursor.y + charInfo.yoffset
            
            Graphics.drawPartialImage(cursor.x, cursor.y, charInfo.x, charInfo.y, charInfo.width, charInfo.height,
                SHCFonts.getBMFont().sheet)
            cursor.x = cursor.x + charInfo.xadvance
            cursor.y = position.y
        end
    end
    Graphics.termBlend()
end

return MainBottomScreen
