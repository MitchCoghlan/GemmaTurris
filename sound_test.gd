extends Control

@onready var spinbox: SpinBox = $SpinBox

# Called when the node enters the scene tree for the first time.
func load_music():
	var stream = preload("res://sounds/music/video_game-converted.mp3")
	AudioManager.music.load_stream(stream, true)

func _ready():
	load_music()
