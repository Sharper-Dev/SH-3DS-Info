local SHCImage = {}
SHCImage.__index = SHCImage
local SHCTransform = require("shc_transform")

function SHCImage:new(imagePath)
    local this = setmetatable({}, SHCImage)
    this.transform = SHCTransform:new()
    this.imagePath = imagePath or ""
    this.isVisible = true
    if this.imagePath ~= "" then
        this.image = Graphics.loadImage(this.imagePath)
    else
        local newImage = Screen.createImage(100, 100, Color.new(255, 255, 255))
        this.image = Graphics.convertFrom(newImage)
    end
    return this
end

function SHCImage:_drawGPU()
    if not self.isVisible then return end
    Graphics.drawImage(self.transform.position.x, self.transform.position.y, self.image)
end

return SHCImage
