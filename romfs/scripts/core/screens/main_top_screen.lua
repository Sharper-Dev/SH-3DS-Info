local MainTopScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("sh_canvas.shc_builder")
local SHCDebugger = require("sh_canvas.shc_debugger")
local SystemInfo = require("core.utils.system_info")
local BatteryHud = require("core.hud.battery_hud")

local canvasTop = SHCanvas:new(TOP_SCREEN)

local dateText
local timeText
local networkText
local freeSpaceText

function MainTopScreen.setup()
    SHCBuilder.createImage(canvasTop, "romfs:/images/top_background.png", 0, 0, 0)
    BatteryHud.create(canvasTop)
    
    local textScale = 0.8
    local font = "dogicapixelbmf"
    dateText = SHCBuilder.createText(canvasTop, font, textScale, 140, 9, 1, "")
    timeText = SHCBuilder.createText(canvasTop, font, textScale, 172, 25, 1, "")
    networkText = SHCBuilder.createText(canvasTop, font, textScale, 7, 113, 1, "")
    
     local columnContent1 = "User: " .. SystemInfo.getUsername() .. "\n" ..
         "Birthday: " .. SystemInfo.getBirthday()
    
    SHCBuilder.createText(canvasTop, font, textScale, 7, 53, 1, columnContent1)
    
    local columnContent2 = "Model: " .. SystemInfo.getModel() .. "\n" ..
        "Region: " .. SystemInfo.getRegion() .. "\n" ..
        "Language:\n" .. SystemInfo.getLanguage() .. "\n" ..
        "Firmware: " .. SystemInfo.getFirmware() .. "\n" ..
        "Kernel: " .. SystemInfo.getKernel() .. "\n" ..
        "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz"
    
    SHCBuilder.createText(canvasTop, font, textScale, 204, 53, 1, columnContent2)
    
    freeSpaceText = SHCBuilder.createText(canvasTop, font, textScale, 7, 233, 1, "")
end

function MainTopScreen.update()
    dateText:setContent(SystemInfo.getDate().month .. "/" .. SystemInfo.getDate().day .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
    timeText:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
    freeSpaceText:setContent("SDMC: " .. string.format("%.2f", SystemInfo.getFreeSpace()) .. "GB Free")
    
    networkText:setContent("Wifi: " .. SystemInfo.getNetwork().isWifiEnabled .. "\n" ..
        "Level: " .. SystemInfo.getNetwork().wifiLevel .. "\n" ..
        "MAC:\n" .. SystemInfo.getNetwork().mac)
    
    BatteryHud.setLevel(SystemInfo.getBattery().life - 1)
    BatteryHud.updateChargeState(SystemInfo.getBattery().isCharging)
    
    SHCDebugger.update()
    
    canvasTop:draw()
end

return MainTopScreen