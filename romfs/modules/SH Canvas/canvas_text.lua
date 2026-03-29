local CanvasText = {}
CanvasText.__index = CanvasText
local FontsManager = require("fonts_manager")

function CanvasText:new(options)
    local this = setmetatable({}, CanvasText)

    this.fontName = options.fontName or "Arial"
    this.content = options.content or ""
    this.size = options.size or 3
    this.color = options.color or Color.new(255, 255, 255)
    this.posx = options.posx or 0
    this.posy = options.posy or 0
    return this
end 

function CanvasText:setTextSize(pixelSize)
    self.size = pixelSize
end

function CanvasText:getTextSize()
    return self.size
end

function CanvasText:setTextContent(content)
    self.content = content
end

function CanvasText:getTextContent()
    return self.content
end

function CanvasText:setColor(color)
    self.color = color
end

function CanvasText:getColor()
    return self.color
end

function CanvasText:setFont(fontName)
    self.fontName = fontName
end

function CanvasText:getFontName()
    return self.fontName
end

function CanvasText:setTextPosition(posx, posy)
    self.posx = posx
    self.posy = posy
end

function CanvasText:getTextPosition()
    return self.posx, self.posy
end

function CanvasText:_draw(space)
    Font.print(FontsManager.getFont(self.fontName), self.posx, self.posy, self.content, self.color, space)
end
return CanvasText