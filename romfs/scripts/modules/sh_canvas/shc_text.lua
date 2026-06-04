local SHCText = {}
SHCText.__index = SHCText

local SHCFonts = require("sh_canvas.shc_fonts")
local SHCTransform = require("sh_canvas.shc_transform")
local utf8 = require("utf8")

function SHCText:new(properties)
    local this = setmetatable({}, SHCText)
    
    this.transform = properties.transform or SHCTransform:new()
    this:setFontID(properties.fontID or "arial")
    this:setContent(properties.content or "")
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

function SHCText:_drawGPU()
    local cursor = { x = self.transform.position.x, y = self.transform.position.y }

    for i, code in utf8.codes(self.content) do
        local charInfo = SHCFonts.getFont("dogicapixelbold").data.chars[code]
        if charInfo then
             Graphics.drawImageExtended(cursor.x + charInfo.xoffset, cursor.y + charInfo.yoffset * self.transform.scale.y, charInfo.x, charInfo.y, charInfo.width, charInfo.height,
                 self.transform.rotation, self.transform.scale.x, self.transform.scale.y,
                 SHCFonts.getFont("dogicapixelbold").sheet)
            cursor.x = cursor.x + charInfo.xadvance * self.transform.scale.x
        end
    end
end

return SHCText
