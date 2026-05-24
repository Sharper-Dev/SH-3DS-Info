local SHCText = {}
SHCText.__index = SHCText
local SHCFonts = require("shc_fonts")
local SHCTransform = require("shc_transform")

function SHCText:new(properties)
    local this = setmetatable({}, SHCText)
    
    this.transform = properties.transform or SHCTransform:new()
    this.fontName = properties.fontName or "arial"
    this.content = properties.content or ""
    this.size = properties.size or 3
    this.color = properties.color or Color.new(255, 255, 255)
    
    local font = SHCFonts.getFont(this.fontName)
    Font.setPixelSizes(font, this.size)
    
    return this
end

function SHCText.createText(x, y, z, content)
    local text = SHCText:new({
        transform = SHCTransform:new():setPosition(x, y, z),
        fontName = SHCFonts.DEFAULT_FONT,
        size = SHCFonts.DEFAULT_FONT_SIZE,
        content = content
    })

    return text
end

function SHCText:setSize(pixelSize)
    self.size = pixelSize
    local font = SHCFonts.getFont(self.fontName)
    Font.setPixelSizes(font, self.size)
end

function SHCText:setTexture(texture)
    self.containerTexture = texture
end

function SHCText:getSize()
    return self.size
end

function SHCText:setContent(content)
    self.content = content
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

function SHCText:_drawCPU(screen)
    Font.print(SHCFonts.getFont(self.fontName), self.transform.position.x, self.transform.position.y, self.content,
        self.color, screen)
end

return SHCText
