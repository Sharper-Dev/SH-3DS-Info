package.path = package.path .. ";romfs:/scripts/?.lua;romfs:/scripts/modules/?.lua;romfs:/scripts/modules/?/?.lua"

local InputSystem = require("lpp_input_system")
local SHCFonts = require("sh_canvas.shc_fonts")
local MainTopScreen = require("core.screens.main_top_screen")
local MainBottomScreen = require("core.screens.main_bottom_screen")

local function setup()
    Graphics.init()
    SHCFonts.loadFont("dogica_16px")
    SHCFonts.loadFont("dogica_8px")
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
    
    if InputSystem.getKeyDown(KEY_HOME) or InputSystem.getKeyDown(KEY_POWER) then
        Graphics.term()
        System.exit()
    end
end
