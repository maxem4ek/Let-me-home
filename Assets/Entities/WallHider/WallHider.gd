@tool
extends Node3D

@export var collider : CollisionShape3D

func _ready() -> void:
	update_collider()
	
func update_collider():
	collider.disabled = !visible
