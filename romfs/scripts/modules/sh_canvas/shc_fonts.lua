local SHCFonts = {}
local loadedFonts = {}

local FONTS_PATH = "romfs:/fonts/"

function SHCFonts.createFont(fontName, fontID)
    local font = Font.load(FONTS_PATH .. fontName .. ".ttf")
    loadedFonts[fontID] = font
end

function SHCFonts.destroyFont(fontID)
    Font.unload(loadedFonts[fontID])
    loadedFonts[fontID] = nil
end

function SHCFonts.getFont(fontID)
    return loadedFonts[fontID]
end

return SHCFonts
