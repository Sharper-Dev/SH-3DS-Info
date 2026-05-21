local MainTopScreen = {}

local DEFAULT_FONT = "dogicapixelbold"
local DEFAULT_FONT_SIZE = 10

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCTransform = require("shc_transform")
local SystemInfo = require("system_info")

local canvasTop = SHCanvas:new(TOP_SCREEN)

local topBackground = SHCImage:new("romfs:/images/TopPlaceHolder.png")

local function createText(x, y, z, content)
    local text = SHCText:new({
        transform = SHCTransform:new():setPosition(x, y, z),
        fontName = DEFAULT_FONT,
        size = DEFAULT_FONT_SIZE,
        content = content
    })
    return text
end

function MainTopScreen.setup()
    local userText = createText(5, 47, 1, "User: " .. SystemInfo.getUsername())
    local birthdayText = createText(5, 67, 1, "Birthday: " .. SystemInfo.getBirthday())
    local modelText = createText(199, 47, 1, "Model: " .. SystemInfo.getModel())
    local regionText = createText(199, 67, 1, "Region: " .. SystemInfo.getRegion())
    local languageText = createText(199, 87, 1, "Language:")
    local languageValueText = createText(199, 107, 1, SystemInfo.getLanguage())
    local firmwareText = createText(199, 127, 1, "Firmware: " .. SystemInfo.getFirmware())
    local kernelText = createText(199, 147, 1, "Kernel: " .. SystemInfo.getKernel())
    local cpuText = createText(199, 167, 1, "CPU Speed: " .. SystemInfo.getCpuSpeed() .. "Mhz")
    
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
end

function MainTopScreen.draw()
    canvasTop:draw()
end

return MainTopScreen