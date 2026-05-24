local SHCFonts = {}
local loadedFonts = {}

SHCFonts.DEFAULT_FONT = "dogicapixelbold"
SHCFonts.DEFAULT_FONT_SIZE = 10

local FONTS_PATH = "romfs:/fonts/"
local AVAILABLE_FONTS = { "dogicapixelbold", "arial" }


function SHCFonts.setFontsPath(path)
    FONTS_PATH = path
end

function SHCFonts.loadFont(fontName)
    local font = Font.load(FONTS_PATH .. fontName .. ".ttf")
    loadedFonts[fontName] = font
end

function SHCFonts.loadAllFonts()
    for i in ipairs(AVAILABLE_FONTS) do
        SHCFonts.loadFont(AVAILABLE_FONTS[i])
    end
end

function SHCFonts.getFont(fontName)
    return loadedFonts[fontName]
end

return SHCFonts
