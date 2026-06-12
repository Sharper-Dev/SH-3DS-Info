local MainTopDesign = {}
local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SystemInfo = require("core.utils.system_info")
local BatteryHud = require("core.hud.battery_hud")

local textScale = 0.8
local font = "dogica_16px"

MainTopDesign.components = {}
function MainTopDesign.setup()
    MainTopDesign.canvas = SHCanvas:new(TOP_SCREEN)
    SHCBuilder.createImage(MainTopDesign.canvas, "romfs:/images/top_background.png", 0, 0, 0)
    BatteryHud.create(MainTopDesign.canvas)
    MainTopDesign.components["batteryHud"] = BatteryHud
    MainTopDesign.components["dateText"] = SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 140, 9, 1, "")
    MainTopDesign.components["timeText"] = SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 172, 25, 1, "")
    MainTopDesign.components["networkText"] = SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 7, 113, 1, "")
    
    local columnContent1 = "User: " .. SystemInfo.getUsername() .. "\n" ..
        "Birthday: " .. SystemInfo.getBirthday()
    local columnContent2 = "Model: " .. SystemInfo.getModel() .. "\n" ..
        "Region: " .. SystemInfo.getRegion() .. "\n" ..
        "Language:\n" .. SystemInfo.getLanguage() .. "\n" ..
        "Firmware: " .. SystemInfo.getFirmware() .. "\n" ..
        "Kernel: " .. SystemInfo.getKernel() .. "\n" ..
        "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz"
    
    SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 7, 53, 1, columnContent1)
    SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 204, 53, 1, columnContent2)
    
    MainTopDesign.components["freeSpaceText"] = SHCBuilder.createText(MainTopDesign.canvas, font, textScale, 7, 233, 1, "")
end

return MainTopDesign
