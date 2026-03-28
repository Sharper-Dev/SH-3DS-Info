local FontsManager = {}
local loadedFonts = {}

function FontsManager.loadFont(fontName)
    local font = Font.load("romfs:/fonts/".. fontName .. ".ttf")
    loadedFonts[fontName] = font
end

function FontsManager.getFont(fontName)
    return loadedFonts[fontName]
end
return FontsManager