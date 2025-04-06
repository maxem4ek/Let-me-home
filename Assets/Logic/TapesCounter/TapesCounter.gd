extends Node

@export var label : Label
var count = 0

func _ready() -> void:
	label.visible = false
	PlayerStory.tape_finded.connect(func(_num): update_label())
	
func update_label():
	count += 1
	if count == 1:
		label.visible = true
	label.text = "TAPES %s/5" % [count]
