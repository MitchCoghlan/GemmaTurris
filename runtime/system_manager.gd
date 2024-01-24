extends Node

class SysInfoInstance extends Node:
	func retrieve():
		var system_info: Dictionary = {
			"host": {
				"OS": {
					"name": OS.get_distribution_name(),
					"version": OS.get_version(),
					"type": OS.get_name()
				},
				"processor": {
					"count": OS.get_processor_count(),
					"name": OS.get_processor_name()
				},
				"locale_lang": OS.get_locale_language(),
				"locale": OS.get_locale()
			}
		}
		
		return system_info
	
	func _ready():
		name = "InfoHandlerInstance"
		match OS.get_name():
			"Windows":
				OS.execute("cls", [])
			"Linux":
				OS.execute("clear", [])
			


var info = SysInfoInstance.new()

func _ready():
	add_child(info)
	print("Playing on {host_os} version {version}".format({
		"host_os": info.retrieve().host.OS.name,
		"version": info.retrieve().host.OS.version
	}))
	
	print("Initialised System Manager")
