local MainTopScreen = {}

local SHCanvas = require("sh_canvas")
local SHCBuilder = require("shc_builder")
local SHCDebugger = require("shc_debugger")
local SystemInfo = require("system_info")
local BatteryHud = require("battery_hud")

local canvasTop = SHCanvas:new(TOP_SCREEN)

local dateText
local timeText
local networkText
local freeSpaceText

function MainTopScreen.setup()
    SHCBuilder.createImage(canvasTop, "romfs:/images/top_background.png", 0, 0, 0)
    BatteryHud.create(canvasTop)
    
    dateText = SHCBuilder.createText(canvasTop, "dpb1", 140, 2, 1, "")
    timeText = SHCBuilder.createText(canvasTop, "dpb1", 172, 18, 1, "")
    networkText = SHCBuilder.createText(canvasTop, "dpb1", 5, 107, 1, "")
    
    local columnContent1 = "User: " .. SystemInfo.getUsername() .. "\n" ..
        "Birthday: " .. SystemInfo.getBirthday()
    
    SHCBuilder.createText(canvasTop, "dpb1", 5, 47, 1, columnContent1)
    
    local columnContent2 = "Model: " .. SystemInfo.getModel() .. "\n" ..
        "Region: " .. SystemInfo.getRegion() .. "\n" ..
        "Language:\n" .. SystemInfo.getLanguage() .. "\n" ..
        "Firmware: " .. SystemInfo.getFirmware() .. "\n" ..
        "Kernel: " .. SystemInfo.getKernel() .. "\n" ..
        "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz"
    
    SHCBuilder.createText(canvasTop, "dpb1", 199, 47, 1, columnContent2)

    freeSpaceText = SHCBuilder.createText(canvasTop, "dpb1", 1, 226, 1, "")
end

function MainTopScreen.update()
    dateText:setContent(SystemInfo.getDate().day .. "/" .. SystemInfo.getDate().month .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
    timeText:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
    freeSpaceText:setContent("SDMC: " .. string.format("%.2f", SystemInfo.getFreeSpace()) .. "GB Free")
    networkText:setContent("Wifi: " .. tostring(SystemInfo.getNetwork().isWifiEnabled) .. "\n" ..
        "Level: " .. SystemInfo.getNetwork().wifiLevel .. "\n" ..
        "MAC:\n" .. SystemInfo.getNetwork().mac)
    
    BatteryHud.setLevel(SystemInfo.getBattery().life - 1)
    BatteryHud.updateChargeState(SystemInfo.getBattery().isCharging)
    
    SHCDebugger.update()
    
    canvasTop:draw()
end

return MainTopScreen