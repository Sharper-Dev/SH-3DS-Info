package.path = package.path .. ";romfs:/modules/?.lua"
package.path = package.path .. ";romfs:/modules/SH Canvas/?.lua"
package.path = package.path .. ";romfs:/modules/LPP Input System/?.lua"

local SHCanvas = require("sh_canvas")
local SHCText = require("shc_text")
local SHCImage = require("shc_image")
local SHCTransform = require("shc_transform")

local InputSystem = require("lpp_input_system")
local SystemInfo = require("system_info")

local canvas1 = SHCanvas:new()
local canvasBottom = SHCanvas:new(BOTTOM_SCREEN)
local userText = nil
local birthdayText = nil
local image = SHCImage:new("romfs:/images/TopPlaceHolder.png")
local bottomBack = SHCImage:new("romfs:/images/bottom_background.png")

local function setup()
    Graphics.init()
    SHCanvas.init()
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
    canvas1:addCanvasComponent(userText)
    canvas1:addCanvasComponent(birthdayText)
    canvas1:addCanvasComponent(image)
    canvasBottom:addCanvasComponent(bottomBack)
end
setup()
local function update()
    InputSystem.readInputs()
    canvas1:draw()
    canvasBottom:draw()
end

while true do
    Screen.refresh()
    
    Screen.waitVblankStart()
    Screen.clear(TOP_SCREEN)
    Screen.clear(BOTTOM_SCREEN)
    update()
    
    Screen.flip()
    if InputSystem.getKeyDown(KEY_HOME) then
        System.showHomeMenu()
    end
    if System.checkStatus() == APP_EXITING then
        System.exit()
        break
    end
end
