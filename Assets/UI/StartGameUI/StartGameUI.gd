extends Control

@export var button : Button

func _ready() -> void:
	Game.start_screen = self
	button.button_down.connect(func(): Game.start())
