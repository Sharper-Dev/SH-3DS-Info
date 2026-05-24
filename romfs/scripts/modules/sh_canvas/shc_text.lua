local SHCText = {}
SHCText.__index = SHCText

local SHCFonts = require("shc_fonts")
local SHCTransform = require("shc_transform")

function SHCText:new(properties)
    local this = setmetatable({}, SHCText)
    
    this.transform = properties.transform or SHCTransform:new()
    this:setFont(properties.fontName or "arial")
    this:setContent(properties.content or "")
    this:setSize(properties.size or 3)
    this:setColor(properties.color or Color.new(255, 255, 255))
    this:setLineBreak(properties.lineBreakDistance or 20)
    
    return this
end

function SHCText:setLineBreak(distance)
    self.lineBreakDistance = distance
end

function SHCText:getLineBreak()
    return self.lineBreakDistance
end

function SHCText:setSize(pixelSize)
    self.size = pixelSize
    local font = SHCFonts.getFont(self.fontName)
    Font.setPixelSizes(font, self.size)
end

function SHCText:getSize()
    return self.size
end

function SHCText:setContent(content)
    self.content = content
    self.contentLines = {}
    for line in content:gmatch("[^\r\n]+") do
        table.insert(self.contentLines, line)
    end
end

function SHCText:getContent()
    return self.content
end

function SHCText:setColor(color)
    self.color = color
end

function SHCText:getColor()
    return self.color
end

function SHCText:setFont(fontName)
    self.fontName = fontName
end

function SHCText:getFontName()
    return self.fontName
end

function SHCText.createQuickText(x, y, z, content, canvas)
    local text = SHCText:new({
        transform = SHCTransform:new():setPosition(x, y, z),
        fontName = SHCFonts.DEFAULT_FONT,
        size = SHCFonts.DEFAULT_FONT_SIZE,
        content = content
    })
    canvas:addCanvasComponent(text)
    
    return text
end

function SHCText:_drawCPU(screen)
    for i, line in ipairs(self.contentLines) do
        Font.print(SHCFonts.getFont(self.fontName), self.transform.position.x, self.transform.position.y + (i - 1) * self.lineBreakDistance, line,
            self.color, screen)
    end
end

return SHCText
