local InfoParser = {}
local MODELS = {
    [0] = "Nintendo 3DS",
    [1] = "Nintendo 3DS XL",
    [2] = "New 3DS",
    [3] = "Nintendo 2DS",
    [4] = "New 3DS XL",
    [5] = "New 2DS XL"
}
local REGIONS = {
    [1] = "USA",
    [2] = "EUR",
    [3] = "JPN"
}
local LANGUAGES = {
    [0] = "Japanese",
    [1] = "English",
    [2] = "French",
    [3] = "Deutsch",
    [4] = "Italian",
    [5] = "Spanish",
    [6] = "Simplified Chinese",
    [7] = "Korean",
    [8] = "Russian",
    [9] = "Portuguese",
    [10] = "Traditional Chinese",
}
local WEEKS = {
    [1] = "Monday",
    [2] = "Tuesday",
    [3] = "Wednesday",
    [4] = "Thursday",
    [5] = "Friday",
    [6] = "Saturday",
    [7] = "Sunday"
}

function InfoParser.parseModel(modelID)
    return MODELS[modelID]
end

function InfoParser.parseLanguage(languageID)
    return LANGUAGES[languageID]
end

function InfoParser.parseRegion(regionID)
    local valueToReturn
    if regionID ~= 1 and regionID ~= 2 then
        valueToReturn = REGIONS[3]
    else
        valueToReturn = REGIONS[regionID]
    end
    return valueToReturn
end

function InfoParser.parseWeek(weekID)
    return WEEKS[weekID]
end

return InfoParser