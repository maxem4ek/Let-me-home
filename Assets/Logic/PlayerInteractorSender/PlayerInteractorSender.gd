extends Node

@export var raycast : RayCast3D

var last_collider : InteractorReceiver

func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider is InteractorReceiver:
			if collider != last_collider:
				if last_collider != null:
					last_collider.interactor_unhover()
				last_collider = collider
			collider.interactor_hover()
			if Input.is_action_just_pressed("use"):
				collider.interactor_use()
