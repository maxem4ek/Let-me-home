extends AudioStreamPlayer

func _ready() -> void:
	PlayerStory.tape_finded.connect(func(number): if number == 2 : stop())
