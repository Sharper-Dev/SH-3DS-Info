local BatteryHud = {}
local SHCBuilder = require("shc_builder")

local SHCDebugger = require("shc_debugger")

local batteryEmpty
local cable
local batteryFills = {}

function BatteryHud.create(canvas)
    batteryEmpty = SHCBuilder.createImage(canvas, "romfs:/images/battery_empty.png", 373, 1, 1)
    
    cable = SHCBuilder.createImage(canvas, "romfs:/images/cable.png", 364, 3, 1)
    cable.isVisible = false
    
    for i = 1, 4 do
        batteryFills[i] = SHCBuilder.createImage(canvas, "romfs:/images/battery_fill.png", batteryEmpty.transform.position.x + (i * 5),
            batteryEmpty.transform.position.y + 2, 2)
    end
    SHCDebugger.startDebug(cable)
end

function BatteryHud.setLevel(level)
    for i = 1, 4 do
        batteryFills[i].isVisible = (5 - i) <= level
    end
end

function BatteryHud.updateChargeState(isCharging)
    cable.isVisible = isCharging
end
return BatteryHud