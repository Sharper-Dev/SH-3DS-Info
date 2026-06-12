local MainTopScreen = {}

local SystemInfo = require("core.utils.system_info")
local MainTopDesign = require("core.screens.design.main_top_design")

local updateTimer
local updateInterval = 1 -- Seconds

function MainTopScreen.setup()
    MainTopDesign.setup()
    updateTimer = { timer = Timer.new(), time = 1000 }
end

function MainTopScreen.update()
    if updateTimer.time >= updateInterval * 1000 then
        MainTopDesign.components["dateText"]:setContent(SystemInfo.getDate().month .. "/" .. SystemInfo.getDate().day .. " (" .. string.sub(SystemInfo.getDate().week, 1, 3) .. ")")
        MainTopDesign.components["timeText"]:setContent(SystemInfo.getTime().hours .. ":" .. SystemInfo.getTime().minutes)
        MainTopDesign.components["freeSpaceText"]:setContent("SDMC: " .. string.format("%.2f", SystemInfo.getFreeSpace()) .. "GB Free")
        MainTopDesign.components["networkText"]:setContent("Wifi: " .. SystemInfo.getNetwork().isWifiEnabled .. "\n" ..
            "Level: " .. SystemInfo.getNetwork().wifiLevel .. "\n" ..
            "MAC:\n" .. SystemInfo.getNetwork().mac)
        MainTopDesign.components["batteryHud"].setLevel(SystemInfo.getBattery().life - 1)
        MainTopDesign.components["batteryHud"].updateChargeState(SystemInfo.getBattery().isCharging)
        Timer.reset(updateTimer.timer)
    end
    updateTimer.time = Timer.getTime(updateTimer.timer)
    MainTopDesign.canvas:draw()
end

return MainTopScreen