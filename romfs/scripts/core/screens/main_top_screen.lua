local MainTopScreen = {}

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCDebugger = require("shc_debugger")
local SystemInfo = require("system_info")

local canvasTop = SHCanvas:new(TOP_SCREEN)
local topBackground = SHCImage:new("romfs:/images/TopPlaceHolder.png")

local dateText
local timeText

function MainTopScreen.setup()
    canvasTop:addCanvasComponent(topBackground)
    
    dateText = SHCText.createQuickText(140, 2, 1, "", canvasTop)
    timeText = SHCText.createQuickText(140, 22, 1, "", canvasTop)
    
    SHCText.createQuickText(5, 47, 1, "User: " .. SystemInfo.getUsername(), canvasTop)
    SHCText.createQuickText(5, 67, 1, "Birthday: " .. SystemInfo.getBirthday(), canvasTop)
    SHCText.createQuickText(199, 47, 1, "Model: " .. SystemInfo.getModel(), canvasTop)
    SHCText.createQuickText(199, 67, 1, "Region: " .. SystemInfo.getRegion(), canvasTop)
    SHCText.createQuickText(199, 87, 1, "Language:\n" .. SystemInfo.getLanguage(), canvasTop)
    SHCText.createQuickText(199, 127, 1, "Firmware: " .. SystemInfo.getFirmware(), canvasTop)
    SHCText.createQuickText(199, 147, 1, "Kernel: " .. SystemInfo.getKernel(), canvasTop)
    SHCText.createQuickText(199, 167, 1, "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz", canvasTop)
    
    SHCDebugger.startDebug(timeText)
end

function MainTopScreen.update()
    dateText:setContent(SystemInfo.getDate().day .. "/" .. SystemInfo.getDate().month)
    dateText:setContent(dateText:getContent() .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
    timeText:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
    
    SHCDebugger.update() 
    canvasTop:draw()
end

return MainTopScreen