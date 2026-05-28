local SHCFonts = {}
local loadedFonts = {}
local json = require("dkjson")
local FONTS_PATH = "romfs:/fonts/"
local font = {}

function SHCFonts.loadFont(fontName)
    font.sheet = Graphics.loadImage(FONTS_PATH .. fontName .. "/" .. fontName .. ".png")

    local stream = io.open(FONTS_PATH .. fontName .. "/" .. fontName .. ".json", FREAD)
    local content = io.read(stream, 0, io.size(stream))

    font.data = json.decode(content)
    io.close(stream)
    
    local chars = {}
    for _, char in ipairs(font.data.chars) do
        chars[char.id] = char
    end
    font.data.chars = chars
end

function SHCFonts.getBMFont()
    return font
end

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
