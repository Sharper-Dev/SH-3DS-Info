local SHCText = {}
SHCText.__index = SHCText

local SHCFonts = require("sh_canvas.shc_fonts")
local SHCTransform = require("sh_canvas.shc_transform")

function SHCText:new(properties)
    local this = setmetatable({}, SHCText)
    
    this.transform = properties.transform or SHCTransform:new()
    this:setFontID(properties.fontID or "arial")
    this:setContent(properties.content or "")
    this:setSize(this.transform:getScale().x)
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
    self.transform:setScale(pixelSize)
    local font = SHCFonts.getFont(self.fontID)
    Font.setPixelSizes(font, self.transform:getScale().x)
end

function SHCText:getSize()
    return self.transform:getScale().x
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

function SHCText:setFontID(fontID)
    self.fontID = fontID
end

function SHCText:getFontID()
    return self.fontID
end

function SHCText.createQuickText(canvas, fontID, x, y, z, content)
    local text = SHCText:new({
        transform = SHCTransform:new():setPosition(x, y, z):setScale(10),
        fontID = fontID,
        content = content
    })
    
    canvas:addCanvasComponent(text)
    return text
end

function SHCText:_drawCPU(screen)
    for i, line in ipairs(self.contentLines) do
        Font.print(SHCFonts.getFont(self.fontID), self.transform.position.x, self.transform.position.y + (i - 1) * self.lineBreakDistance, line,
            self.color, screen)
    end
end

return SHCText
