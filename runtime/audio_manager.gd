extends Node

class MusicInstance extends Node:
	var stream_player: AudioStreamPlayer
	var looping: bool = true
	
	func load_stream(stream: AudioStream, force_play: bool = false): # Best recommended that you use AudioStreamMP3 for loading audio files from code
		var old_stream: AudioStream = stream_player.stream
		stream_player.stream = stream
		if force_play:
			stream_player.play()
	
	func _init():
		pass
	
	func handle_loop():
		if looping:
			stream_player.seek(0)
			stream_player.play()
	
	func _ready():
		name = "MusicInstance"
		
		stream_player = AudioStreamPlayer.new()
		
		add_child(stream_player)
		stream_player.finished.connect(handle_loop)
	
var music: MusicInstance = MusicInstance.new()

func _ready():
	add_child(music)
