extends Node3D
class_name Player

@export var camera : Camera3D
@export var collision_shape : CollisionShape3D
@export var first_person_move : FirstPersonMove
@export var step_sound_player : StepSoundPlayer

func _ready() -> void:
	Game.player = self
	enable(false)

func enable(value : bool):
	first_person_move.enabled = value
	collision_shape.disabled = !value
	camera.current = value
	step_sound_player.enabled = value
	
