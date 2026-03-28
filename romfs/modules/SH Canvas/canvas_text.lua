local CanvasText = {}
CanvasText.__index = CanvasText
local FontsManager = require("fonts_manager")

function CanvasText:new(fontName, content)
    local this = setmetatable({}, CanvasText)
    this.data = {
        fontName = fontName,
        size = 3,
        color = Color.new(255, 255, 255),
        posx = 0,
        posy = 0,
        content = content
    }
    return this
end 

function CanvasText:setTextSize(pixelSize)
    self.data.size = pixelSize
end

function CanvasText:setTextPosition(posx, posy)
    self.data.posx = posx
    self.data.posy = posy
end
function CanvasText:_draw()
    Font.print(FontsManager.getFont(self.data.fontName), self.data.posx, self.data.posy, self.data.content, self.data.color, TOP_SCREEN)
end
return CanvasText