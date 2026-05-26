local SHCTransform = {}
SHCTransform.__index = SHCTransform

function SHCTransform:new()
    local this = setmetatable({}, SHCTransform)
    this.position = { x = 0, y = 0, z = 0 }
    this.rotation = { x = 0, y = 0, z = 0 }
    this.scale = { x = 1, y = 1, z = 1 }
    return this
end

function SHCTransform:setPosition(x, y, z)
    self.position.x = x or self.position.x
    self.position.y = y or self.position.y
    self.position.z = z or self.position.z
    return self
end

function SHCTransform:getPosition()
    return self.position
end

function SHCTransform:setRotation(x, y, z)
    self.rotation.x = x or self.rotation.x
    self.rotation.y = y or self.rotation.y
    self.rotation.z = z or self.rotation.z
    return self
end

function SHCTransform:getRotation()
    return self.rotation
end

function SHCTransform:setScale(x, y, z)
    self.scale.x = x or self.scale.x
    self.scale.y = y or self.scale.y
    self.scale.z = z or self.scale.z
    return self
end

function SHCTransform:getScale()
    return self.scale
end

return SHCTransform