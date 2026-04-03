local systemInfo = {}
systemInfo.infos = {
    firmware = {
        major = (select(1, System.getFirmware())),
        minor = (select(2, System.getFirmware())),
        revision = (select(3, System.getFirmware()))
    },
    kernel = {
        major = (select(1, System.getKernel())),
        minor = (select(2, System.getKernel())),
        revision = (select(3, System.getKernel()))
    },
    region = System.getRegion(),
    username = System.getUsername(),
    birthday = {
        day = (select(1, System.getBirthday())),
        month = (select(2, System.getBirthday()))
    },
    battery = {
        isCharging = System.isBatteryCharging(),
        life = nil
    },
    model = System.getModel(),
    language = System.getLanguage(),
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
    },
    cpuSpeed = System.getCpuSpeed()
}
function systemInfo.refreshInfos()
    systemInfo.infos.battery.isCharging = System.isBatteryCharging()
    systemInfo.infos.battery.life = System.getBatteryLife()

    systemInfo.infos.time.hours = (select(1, System.getTime()))
    systemInfo.infos.time.minutes = (select(2, System.getTime()))
    systemInfo.infos.time.seconds = (select(3, System.getTime()))

    systemInfo.infos.date.week = (select(1, System.getDate()))
    systemInfo.infos.date.day = (select(2, System.getDate()))
    systemInfo.infos.date.month = (select(3, System.getDate()))
    systemInfo.infos.date.year = (select(4, System.getDate()))
end

return systemInfo
