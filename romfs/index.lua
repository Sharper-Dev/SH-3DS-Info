package.path = package.path .. ";romfs:/scripts/core/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/SH Canvas/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/LPP Input System/?.lua"

local SHCanvas = require("sh_canvas")
local MainScreen = require("main_screen")
local InputSystem = require("lpp_input_system")

local function setup()
    Graphics.init()
    SHCanvas.init()
    MainScreen.setup()
end

setup()

local function update()
    InputSystem.readInputs()
    MainScreen.draw()
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
