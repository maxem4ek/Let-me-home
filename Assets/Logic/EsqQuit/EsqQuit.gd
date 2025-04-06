extends Node
class_name EsqQuit

@export var enabled : bool

func _ready() -> void:
	Game.esq_quit = self

func _process(delta: float) -> void:
	if enabled:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
