local FontsManager = {}
local loadedFonts = {}
local fontsPath = "romfs:/fonts/"
local availableFonts = { "dogicapixelbold", "arial" }

function FontsManager.setFontsPath(path)
    fontsPath = path
end

function FontsManager.loadFont(fontName)
    local font = Font.load(fontsPath .. fontName .. ".ttf")
    loadedFonts[fontName] = font
end

function FontsManager.loadAllFonts()
    for i in ipairs(availableFonts) do
        FontsManager.loadFont(availableFonts[i])
    end
end

function FontsManager.getFont(fontName)
    return loadedFonts[fontName]
end

return FontsManager
