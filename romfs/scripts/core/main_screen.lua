local MainScreen = {}

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCTransform = require("shc_transform")
local SystemInfo = require("system_info")
local InfoParser = require("info_parser")

local canvasTop = SHCanvas:new(TOP_SCREEN)
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)

local userText = nil
local birthdayText = nil
local modelText = nil
local regionText = nil
local languageText = nil
local languageValueText = nil

local topBackground = SHCImage:new("romfs:/images/TopPlaceHolder.png")
local bottomBackground = SHCImage:new("romfs:/images/bottom_background.png")

function MainScreen.setup()
    userText = SHCText:new({
        transform = SHCTransform:new():setPosition(5, 47, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = "User: " .. SystemInfo.infos.username
    })
    birthdayText = SHCText:new({
        transform = SHCTransform:new():setPosition(5, 67, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = "Birthday: " .. string.format("%02d", SystemInfo.infos.birthday.day) .. "/" .. string.format("%02d", SystemInfo.infos.birthday.month)
    })
    
    modelText = SHCText:new({
        transform = SHCTransform:new():setPosition(199, 47, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = "Model: " .. InfoParser.parseModel(SystemInfo.infos.model)
    })
    regionText = SHCText:new({
        transform = SHCTransform:new():setPosition(199, 67, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = "Region: " .. InfoParser.parseRegion(SystemInfo.infos.region)
    })
    languageText = SHCText:new({
        transform = SHCTransform:new():setPosition(199, 87, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = "Language:"
    })
    languageValueText = SHCText:new({
        transform = SHCTransform:new():setPosition(199, 107, 1),
        fontName = "dogicapixelbold",
        size = 10,
        content = InfoParser.parseLanguage(SystemInfo.infos.language)
    })
    
    canvasTop:addCanvasComponent(userText)
    canvasTop:addCanvasComponent(birthdayText)
    canvasTop:addCanvasComponent(topBackground)
    canvasTop:addCanvasComponent(modelText)
    canvasTop:addCanvasComponent(regionText)
    canvasTop:addCanvasComponent(languageText)
    canvasTop:addCanvasComponent(languageValueText)
    canvasBottom:addCanvasComponent(bottomBackground)
end

function MainScreen.draw()
    canvasTop:draw()
    canvasBottom:draw()
end

return MainScreen