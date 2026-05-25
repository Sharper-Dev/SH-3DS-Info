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

function MainTopScreen.setup()
    canvasTop:addCanvasComponent(topBackground)
    
    dateText = SHCText.createQuickText(canvasTop, "dpb1", 140, 2, 1, "")
    timeText = SHCText.createQuickText(canvasTop, "dpb1", 172, 18, 1, "")
    
    SHCText.createQuickText(canvasTop, "dpb1", 5, 47, 1, "User: " .. SystemInfo.getUsername())
    SHCText.createQuickText(canvasTop, "dpb1", 5, 67, 1, "Birthday: " .. SystemInfo.getBirthday())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 47, 1, "Model: " .. SystemInfo.getModel())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 67, 1, "Region: " .. SystemInfo.getRegion())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 87, 1, "Language:\n" .. SystemInfo.getLanguage())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 127, 1, "Firmware: " .. SystemInfo.getFirmware())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 147, 1, "Kernel: " .. SystemInfo.getKernel())
    SHCText.createQuickText(canvasTop, "dpb1", 199, 167, 1, "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz")
    BatteryHud.create(canvasTop)
end

function MainTopScreen.update()
    dateText:setContent(SystemInfo.getDate().day .. "/" .. SystemInfo.getDate().month)
    dateText:setContent(dateText:getContent() .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
    timeText:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
    BatteryHud.setLevel(SystemInfo.getBattery().life)
    SHCDebugger.update() 
    canvasTop:draw()
end

return MainTopScreen