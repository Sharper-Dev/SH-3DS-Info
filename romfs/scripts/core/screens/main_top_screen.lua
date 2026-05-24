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
    dateText = SHCText.createText(140, 2, 1,"")
    timeText = SHCText.createText(140, 22, 1, "")
    
    local userText = SHCText.createText(5, 47, 1, "User: " .. SystemInfo.getUsername())
    local birthdayText = SHCText.createText(5, 67, 1, "Birthday: " .. SystemInfo.getBirthday())
    local modelText = SHCText.createText(199, 47, 1, "Model: " .. SystemInfo.getModel())
    local regionText = SHCText.createText(199, 67, 1, "Region: " .. SystemInfo.getRegion())
    local languageText = SHCText.createText(199, 87, 1, "Language:")
    local languageValueText = SHCText.createText(199, 107, 1, SystemInfo.getLanguage())
    local firmwareText = SHCText.createText(199, 127, 1, "Firmware: " .. SystemInfo.getFirmware())
    local kernelText = SHCText.createText(199, 147, 1, "Kernel: " .. SystemInfo.getKernel())
    local cpuText = SHCText.createText(199, 167, 1, "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz")
    dateText:setContent("a")
    canvasTop:addCanvasComponent(dateText)
    canvasTop:addCanvasComponent(timeText)
    canvasTop:addCanvasComponent(userText)
    canvasTop:addCanvasComponent(birthdayText)
    canvasTop:addCanvasComponent(topBackground)
    canvasTop:addCanvasComponent(modelText)
    canvasTop:addCanvasComponent(regionText)
    canvasTop:addCanvasComponent(languageText)
    canvasTop:addCanvasComponent(languageValueText)
    canvasTop:addCanvasComponent(firmwareText)
    canvasTop:addCanvasComponent(kernelText)
    canvasTop:addCanvasComponent(cpuText)
    
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