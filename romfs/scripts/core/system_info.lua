local SystemInfo = {}
local InfoParser = require("info_parser")

function SystemInfo.getDate()
    local week, day, month, year = System.getDate()

    day = string.format("%02d", day)
    month = string.format("%02d", month)
    week = InfoParser.parseWeek(week)
    return { week = week, day = day, month = month, year = year }
end

function SystemInfo.getTime()
    local hours, minutes, seconds = System.getTime()
    hours = string.format("%02d", hours)
    minutes = string.format("%02d", minutes)
    seconds = string.format("%02d", seconds)
    
    return { hours = hours, minutes = minutes, seconds = seconds }
end

function SystemInfo.getBattery()
    local batteryTable = {}

    batteryTable.isCharging = System.isBatteryCharging()
    batteryTable.life = System.getBatteryLife()

    return batteryTable
end

function SystemInfo.getUsername()
    return System.getUsername()
end

function SystemInfo.getBirthday()
    local day, month = System.getBirthday()

    return string.format("%02d", month) .. "/" .. string.format("%02d", day)
end

function SystemInfo.getCpuSpeed()
    return System.getCpuSpeed()
end

function SystemInfo.getFirmware()
    local major, minor, revision = System.getFirmware()
    local firmware = major .. "." .. minor .. "." .. revision

    return firmware
end

function SystemInfo.getKernel()
    local major, minor, revision = System.getKernel()
    local kernel = major .. "." .. minor .. "." .. revision

    return kernel
end

function SystemInfo.getRegion()
    local parsed = InfoParser.parseRegion(System.getRegion())

    return parsed
end

function SystemInfo.getModel()
    local parsed = InfoParser.parseModel(System.getModel())

    return parsed
end

function SystemInfo.getLanguage()
    local parsed = InfoParser.parseLanguage(System.getLanguage())

    return parsed
end

return SystemInfo
