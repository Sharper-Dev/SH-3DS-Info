package.path = package.path .. ";romfs:/scripts/core/?.lua"
package.path = package.path .. ";romfs:/scripts/core/screens/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/sh_canvas/?.lua"
package.path = package.path .. ";romfs:/scripts/modules/lpp_input_system/?.lua"

local InputSystem = require("lpp_input_system")
local SHCFonts = require("shc_fonts")
local MainTopScreen = require("main_top_screen")
local MainBottomScreen = require("main_bottom_screen")

local function setup()
    Graphics.init()
    SHCFonts.createFont("dogicapixelbold", "dpb1")
    MainTopScreen.setup()
    MainBottomScreen.setup()
end

setup()

local function update()
    InputSystem.readInputs()
    MainTopScreen.update()
    MainBottomScreen.update()
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
