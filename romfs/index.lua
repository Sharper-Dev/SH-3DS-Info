package.path = package.path .. ";romfs:/modules/?.lua"
package.path = package.path .. ";romfs:/modules/SH Canvas/?.lua"
local systemInfo = require("system_info")
local infoParser = require("info_parser")
local SHCanvas = require("sh_canvas")
local canvasText = require("canvas_text")
SHCanvas.init()
local text = canvasText:new("Arial", "esse é o texto 1")
text:setTextPosition(5, 5)
local text2 = canvasText:new("dogicapixelbold", "esse é o texto 2")
text2:setTextPosition(5, 30)
SHCanvas.addCanvasComponent(text)
SHCanvas.addCanvasComponent(text2)
while true do
	Screen.refresh()
	
	Screen.waitVblankStart()
	Screen.clear(TOP_SCREEN)
	systemInfo.refreshInfos()
	SHCanvas.draw()
	--[[
	Screen.debugPrint(5,5,tostring(infoParser.parseLanguage(systemInfo.infos.language)),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,20,tostring(systemInfo.infos.username),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,35,tostring(infoParser.parseRegion(systemInfo.infos.region)),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,50,tostring(infoParser.parseModel(systemInfo.infos.model)),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,65,tostring(systemInfo.infos.cpuSpeed),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,80,tostring(systemInfo.infos.battery.life),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,95,tostring(systemInfo.infos.battery.isCharging),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(distance,5,systemInfo.infos.birthday.day .. "/" .. systemInfo.infos.birthday.month,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(distance,20,systemInfo.infos.firmware.major .. "." .. systemInfo.infos.firmware.minor .. "." .. systemInfo.infos.firmware.revision,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(distance,35,systemInfo.infos.kernel.major .. "." .. systemInfo.infos.kernel.minor .. "." .. systemInfo.infos.kernel.revision,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(distance,50,string.format("%02d:%02d:%02d", systemInfo.infos.time.hours, systemInfo.infos.time.minutes, systemInfo.infos.time.seconds),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(distance,65,infoParser.parseWeek(systemInfo.infos.date.week) .. ", " .. string.format("%02d/%02d/%04d", systemInfo.infos.date.day, systemInfo.infos.date.month, systemInfo.infos.date.year),Color.new(255,255,255),TOP_SCREEN)
	--]]
	Screen.flip()
	if Controls.check(Controls.read(), KEY_HOME) then
		System.showHomeMenu()
	end
	if System.checkStatus() == APP_EXITING then
		System.exit()
		break
	end
end

