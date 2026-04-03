package.path = package.path .. ";romfs:/modules/?.lua"
package.path = package.path .. ";romfs:/modules/SH Canvas/?.lua"
package.path = package.path .. ";romfs:/modules/LPP Input System/?.lua"
local systemInfo = require("system_info")
local infoParser = require("info_parser")
local SHCanvas = require("sh_canvas")
local canvasText = require("canvas_text")
local InputSystem = require("lpp_input_system")
SHCanvas.init()
local text = canvasText:new({})
text:setTextPosition(5, 5)
text:setTextSize(10)
local canvas1 = SHCanvas:new()
local counter = 0
canvas1:addCanvasComponent(text)

while true do
    Screen.refresh()

    Screen.waitVblankStart()
    Screen.clear(TOP_SCREEN)
    InputSystem.readInputs()
    --systemInfo.refreshInfos()

    if InputSystem.getKeyDown(KEY_A) then
        counter = counter + 1
    end
    if InputSystem.getKeyDown(KEY_B) then
        counter = counter + 2
    end
    if InputSystem.getKeyDown(KEY_X) then
        counter = counter - 1
    end
    local x, y = InputSystem.getCirclePad()
    text:setTextContent("Count: " .. counter .. " Line break \\n" .. tostring(x .. ", " .. y))

    canvas1:draw()

    Screen.flip()
    if InputSystem.getKeyDown(KEY_HOME) then
        System.showHomeMenu()
    end
    if System.checkStatus() == APP_EXITING then
        System.exit()
        break
    end
end
