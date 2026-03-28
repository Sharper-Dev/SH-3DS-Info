local SHCanvas = {}
local components = {}
local FontsManager = require("fonts_manager")

function SHCanvas.init()
    FontsManager.loadFont("dogicapixelbold")
    FontsManager.loadFont("Arial")
end

function SHCanvas.draw()
    for _, component in ipairs(components) do
        component:_draw()
    end
    
end

function SHCanvas.addCanvasComponent(component)
    table.insert(components, component)
end
return SHCanvas