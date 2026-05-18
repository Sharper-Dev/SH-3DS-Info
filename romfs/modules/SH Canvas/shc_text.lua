local SHCText = {}
SHCText.__index = SHCText
local FontsManager = require("fonts_manager")
local SHCTransform = require("shc_transform")

function SHCText:new(properties)
    local this = setmetatable({}, SHCText)
    this.transform = properties.transform or SHCTransform:new()
    this.fontName = properties.fontName or "arial"
    this.content = properties.content or ""
    this.size = properties.size or 3
    this.color = properties.color or Color.new(255, 255, 255)
    local font = FontsManager.getFont(this.fontName)
    Font.setPixelSizes(font, this.size)
    return this
end

function SHCText:setSize(pixelSize)
    self.size = pixelSize
    local font = FontsManager.getFont(self.fontName)
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
    Font.print(FontsManager.getFont(self.fontName), self.transform.position.x, self.transform.position.y, self.content, self.color, screen)
end
return SHCText
