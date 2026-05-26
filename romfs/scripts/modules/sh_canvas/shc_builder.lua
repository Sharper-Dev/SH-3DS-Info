local SHCBuilder = {}

local SHCText = require("shc_text")
local SHCTransform = require("shc_transform")
local SHCImage = require("shc_image")

function SHCBuilder.createText(canvas, fontID, x, y, z, content)
    local text = SHCText:new({
        transform = SHCTransform:new():setPosition(x, y, z):setScale(10),
        fontID = fontID,
        content = content
    })
    
    canvas:addCanvasComponent(text)
    return text
end

function SHCBuilder.createImage(canvas, imagePath,x, y, z)
    local image = SHCImage:new({
        transform = SHCTransform:new():setPosition(x, y, z):setScale(1),
        imagePath = imagePath
    })
    
    canvas:addCanvasComponent(image)
    return image
end
return SHCBuilder