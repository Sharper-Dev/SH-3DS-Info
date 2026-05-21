local MainTopScreen = {}

local DEFAULT_FONT = "dogicapixelbold"
local DEFAULT_FONT_SIZE = 10

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCTransform = require("shc_transform")
local SystemInfo = require("system_info")
local InfoParser = require("info_parser")

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
    local userText = createText(5, 47, 1, "User: " .. SystemInfo.infos.username)
    local birthdayText = createText(5, 67, 1, "Birthday: " .. string.format("%02d", SystemInfo.infos.birthday.day) .. "/" .. string.format("%02d", SystemInfo.infos.birthday.month))
    local modelText = createText(199, 47, 1, "Model: " .. InfoParser.parseModel(SystemInfo.infos.model))
    local regionText = createText(199, 67, 1, "Region: " .. InfoParser.parseRegion(SystemInfo.infos.region))
    local languageText = createText(199, 87, 1, "Language:")
    local languageValueText = createText(199, 107, 1, InfoParser.parseLanguage(SystemInfo.infos.language))
    local firmwareText = createText(199, 127, 1, "Firmware: " .. SystemInfo.infos.firmware.major .. "." .. SystemInfo.infos.firmware.minor .. "." .. SystemInfo.infos.firmware.revision)
    local kernelText = createText(199, 147, 1, "Kernel: " .. SystemInfo.infos.kernel.major .. "." .. SystemInfo.infos.kernel.minor .. "." .. SystemInfo.infos.kernel.revision)
    local cpuText = createText(199, 167, 1, "CPU Speed: " .. SystemInfo.infos.cpuSpeed .. "Mhz")
    
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