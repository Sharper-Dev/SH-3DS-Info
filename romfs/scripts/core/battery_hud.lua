local BatteryHud = {}
local SHCImage = require("shc_image")
local SHCDebugger = require("shc_debugger")

local batteryEmpty
local batteryFills = {}

function BatteryHud.create(canvas)
    batteryEmpty = SHCImage:new("romfs:/images/battery_empty.png")
    batteryEmpty.transform:setPosition(373, 1, 1)
    canvas:addCanvasComponent(batteryEmpty)
    
    for i = 1, 4 do
        batteryFills[i] = SHCImage:new("romfs:/images/battery_fill.png")
        batteryFills[i].transform.position.z = 2
        batteryFills[i].transform.localPosition = {
            x = batteryEmpty.transform.position.x + (i * 5),
            y = batteryEmpty.transform.position.y + 2
        }
        batteryFills[i].transform:setPosition(batteryFills[i].transform.localPosition.x,
            batteryFills[i].transform.localPosition.y)
        canvas:addCanvasComponent(batteryFills[i])
    end
    SHCDebugger.startDebug(batteryEmpty)
end

function BatteryHud.setLevel(level)
    for i = 1, 4 do
        batteryFills[i].isVisible = (5 - i) <= level
    end
end

return BatteryHud