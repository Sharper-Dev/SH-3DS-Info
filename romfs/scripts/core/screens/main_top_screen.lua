local MainTopScreen = {}

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCDebugger = require("shc_debugger")
local SystemInfo = require("system_info")
local BatteryHud = require("battery_hud")

local canvasTop = SHCanvas:new(TOP_SCREEN)
local topBackground = SHCImage:new("romfs:/images/TopPlaceHolder.png")

local dateText
local timeText
local networkText

function MainTopScreen.setup()
    canvasTop:addCanvasComponent(topBackground)
    
    dateText = SHCText.createQuickText(canvasTop, "dpb1", 140, 2, 1, "")
    timeText = SHCText.createQuickText(canvasTop, "dpb1", 172, 18, 1, "")
    networkText = SHCText.createQuickText(canvasTop, "dpb1", 5, 107, 1, "")
    
    local columnContent1 = "User: " .. SystemInfo.getUsername() .. "\n" ..
        "Birthday: " .. SystemInfo.getBirthday()
    
    SHCText.createQuickText(canvasTop, "dpb1", 5, 47, 1, columnContent1)
    
    local columnContent2 = "Model: " .. SystemInfo.getModel() .. "\n" ..
        "Region: " .. SystemInfo.getRegion() .. "\n" ..
        "Language:\n" .. SystemInfo.getLanguage() .. "\n" ..
        "Firmware: " .. SystemInfo.getFirmware() .. "\n" ..
        "Kernel: " .. SystemInfo.getKernel() .. "\n" ..
        "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz"
    
    SHCText.createQuickText(canvasTop, "dpb1", 199, 47, 1, columnContent2)
    
    BatteryHud.create(canvasTop)
end

function MainTopScreen.update()
    dateText:setContent(SystemInfo.getDate().day .. "/" .. SystemInfo.getDate().month .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
    timeText:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
    
    networkText:setContent("Wifi: " .. tostring(SystemInfo.getNetwork().isWifiEnabled) .. "\n" ..
        "Level: " .. SystemInfo.getNetwork().wifiLevel .. "\n" ..
        "MAC:\n" .. SystemInfo.getNetwork().mac)
    
    BatteryHud.setLevel(SystemInfo.getBattery().life - 1)
    BatteryHud.updateChargeState(SystemInfo.getBattery().isCharging)
    
    SHCDebugger.update()
    
    canvasTop:draw()
end

return MainTopScreen