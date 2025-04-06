extends Node
class_name DoorInteractor

@export var locked : bool = true
var has_opened : bool = false

@export var interactor_reciever : InteractorReceiver
@export var animation_player : AnimationPlayer

signal opened
signal closed
signal hovered
signal unhovered

func _ready() -> void:
	interactor_reciever.used.connect(func(): ineract())
	interactor_reciever.hovered.connect(func(): hover())
	interactor_reciever.unhovered.connect(func(): unhover())

func ineract():
	if animation_player.is_playing() == false:
		if !locked:
			if has_opened:
				close()
			else:
				open()

func hover():
	if locked:
		PlayerStory.send_sys_message("Closed")
	else:
		PlayerStory.send_sys_message("Open")
	emit_signal("hovered")

func unhover():
	PlayerStory.send_sys_message("")
	emit_signal("unhovered")

func close():
	animation_player.play("close")
	has_opened = false
	emit_signal("closed")
	
func open():
	animation_player.play("open")
	has_opened = true
	emit_signal("opened")
