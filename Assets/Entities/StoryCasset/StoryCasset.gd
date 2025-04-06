extends Node3D
@export var number = 1
@export_multiline var take_text : String
@export var interactor_receiver : InteractorReceiver
@export var unlock_door : Node3D

func _ready() -> void:
	interactor_receiver.hovered.connect(func(): PlayerStory.send_sys_message("Take"))
	interactor_receiver.used.connect(func(): use())
	
func use():
	PlayerStory.collect_tape(number)
	PlayerStory.send_story_message(take_text)
	if unlock_door != null:
		unlock_door.door_interactor.locked = false
	queue_free()
