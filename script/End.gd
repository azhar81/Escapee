extends Node2D

func _ready():
	GameAudio.stop()
	$"winner audio".play()
