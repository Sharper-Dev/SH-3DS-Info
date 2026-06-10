local SHCImage = {}
SHCImage.__index = SHCImage
local SHCTransform = require("sh_canvas.shc_transform")

function SHCImage:new(properties)
    local this = setmetatable({}, SHCImage)
    this.transform = properties.transform or SHCTransform:new()
    this.imagePath = properties.imagePath or ""
    this.isVisible = properties.isVisible or true
    
    if this.imagePath ~= "" or this.image == nil then
        this.image = Graphics.loadImage(this.imagePath)
    else
        this.image = Graphics.convertFrom(this.image)
    end
    return this
end

function SHCImage:_drawGPU()
    if not self.isVisible then return end

    Graphics.drawImage(self.transform.position.x, self.transform.position.y, self.image)
end

return SHCImage
