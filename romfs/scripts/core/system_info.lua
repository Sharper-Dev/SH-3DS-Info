local SystemInfo = {}
local InfoParser = require("info_parser")

SystemInfo.infos = {
    battery = {
        isCharging = System.isBatteryCharging(),
        life = nil
    },
    time = {
        hours = 0,
        minutes = 0,
        seconds = 0
    },
    date = {
        week = 0,
        day = 0,
        month = 0,
        year = 0
    }
}

function SystemInfo.getUsername()
    return System.getUsername()
end

function SystemInfo.getBirthday()
    local day, month = System.getBirthday()

    return string.format("%02d", day) .. "/" .. string.format("%02d", month)
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

function SystemInfo.refreshInfos()
    SystemInfo.infos.battery.isCharging = System.isBatteryCharging()
    SystemInfo.infos.battery.life = System.getBatteryLife()

    SystemInfo.infos.time.hours = (select(1, System.getTime()))
    SystemInfo.infos.time.minutes = (select(2, System.getTime()))
    SystemInfo.infos.time.seconds = (select(3, System.getTime()))

    SystemInfo.infos.date.week = (select(1, System.getDate()))
    SystemInfo.infos.date.day = (select(2, System.getDate()))
    SystemInfo.infos.date.month = (select(3, System.getDate()))
    SystemInfo.infos.date.year = (select(4, System.getDate()))
end

return SystemInfo
