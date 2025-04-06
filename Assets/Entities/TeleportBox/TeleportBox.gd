extends Node3D

class_name TeleportBox
@export var target_point : Node3D
@export var area3d : Area3D
@export var placeholder_mesh : Node3D

var target_position : Vector3
var target_rotation : Vector3

func _ready() -> void:
	target_position = target_point.global_position
	target_rotation = target_point.global_rotation
	target_point.queue_free()
	placeholder_mesh.queue_free()
	area3d.body_entered.connect(func(body): teleport_body(body))

func teleport_body(body):
	if body is Player:
		body.global_position = target_position
	
