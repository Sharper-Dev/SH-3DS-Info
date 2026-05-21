package.path = package.path .. ";romfs:/scripts/core/?.lua"
package.path = package.path .. ";romfs:/scripts/core/screens/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/SH Canvas/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/LPP Input System/?.lua"

local SHCanvas = require("sh_canvas")

local InputSystem = require("lpp_input_system")
local MainTopScreen = require("main_top_screen")
local MainBottomScreen = require("main_bottom_screen")

local function setup()
    Graphics.init()
    SHCanvas.init()
    MainTopScreen.setup()
    MainBottomScreen.setup()
end

setup()

local function update()
    InputSystem.readInputs()
    MainTopScreen.draw()
    MainBottomScreen.draw()
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
