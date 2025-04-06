extends AudioStreamPlayer

@export var start_number : int 
@export var finish_number : int

var count : int

func _ready() -> void:
	PlayerStory.tape_finded.connect(func(num): _on_tape_finded(num))

func _on_tape_finded(num):
	if num == start_number:
		play()
	if num == finish_number:
		stop()
