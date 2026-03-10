Screen.clear(TOP_SCREEN)
Screen.clear(BOTTOM_SCREEN)
local systemInfo = {
	firmware = {
		major, minor, revision = System.getFirmware()
	},
	kernel = {
		major, minor, revision = System.getKernel()
	},
	region = System.getRegion(),
	username = System.getUsername(),
	birthday = {
		day, month = System.getBirthday()
	},
	battery = {
		isCharging = System.isBatteryCharging(),
		life = System.getBatteryLife()
	},
	model = System.getModel(),
	language = System.getLanguage(),
	time = {
		hours, minutes, seconds = System.getTime()
	},
	date = {
		value, day, month, year = System.getDate()
	},
	cpuSpeed = System.getCpuSpeed()
}
while true do
	Screen.refresh()

	Screen.debugPrint(5,5,tostring(systemInfo.region),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,20,tostring(systemInfo.username),Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(5,35,tostring(systemInfo.language),Color.new(255,255,255),TOP_SCREEN)
	Screen.flip()
	Screen.waitVblankStart()
	if Controls.check(Controls.read(), KEY_B) then
		System.exit()
		break
	end
	if Controls.check(Controls.read(), KEY_HOME) then
		System.showHomeMenu()
		break
	end
	if System.checkStatus() == APP_EXITING then
		System.exit()
	end
end
