local SHCanvas = {}
SHCanvas.__index = SHCanvas
local FontsManager = require("fonts_manager")

function SHCanvas:new(space)
    local this = setmetatable({}, SHCanvas)
    this.space = space or TOP_SCREEN
    this.components = {}
    return this
end
function SHCanvas.init()
    FontsManager.loadAllFonts()
end

function SHCanvas:draw()
    for _, component in ipairs(self.components) do
        component:_draw(self.space)
    end
end

function SHCanvas:addCanvasComponent(component)
    table.insert(self.components, component)
end

return SHCanvas