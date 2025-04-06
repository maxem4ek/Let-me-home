extends Node

class_name FirstPersonMove

@export var enabled : bool = false

@export var body : CharacterBody3D
@export var body_collider : CollisionShape3D
@export var head_camera : Camera3D

@export var fly : bool
@export var speed : float = 5.0
@export var jump_velocity : float = 4.5
@export var camera_sensivity : float = 1

@export var height_ray : RayCast3D
@export var crouch_height : float = 1
@export var stand_height : float = 2
@export var transition_speed : float = 15.0


var crouch : bool = false
var target_height = stand_height
	
	
func _input(event: InputEvent) -> void:
	if enabled:
		if event is InputEventMouseMotion:
			body.rotation.y -= event.relative.x * camera_sensivity * 0.001
			head_camera.rotation.x = clamp(head_camera.rotation.x - event.relative.y * camera_sensivity * 0.001, -1.5, 1.5)

func _physics_process(delta: float) -> void:
	if enabled:
		if not body.is_on_floor():
			if fly == false:
				body.velocity += body.get_gravity() * delta

		if Input.is_action_just_pressed("jump") and body.is_on_floor():
			body.velocity.y = jump_velocity
			
		if Input.is_action_just_pressed("crouch"):
			target_height = crouch_height
			crouch = true
			
		if Input.is_action_just_released("crouch"):
			target_height = stand_height
			crouch = false
				
		if crouch == false and is_obstructed_above():
			crouch = true
			target_height = crouch_height
			
		var shape := body_collider.shape as CapsuleShape3D
		shape.height = lerp(shape.height, target_height, delta * transition_speed)
		head_camera.position.y = lerp(head_camera.position.y, target_height, delta * transition_speed)
			

		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction = (body.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			body.velocity.x = direction.x * speed
			body.velocity.z = direction.z * speed
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, speed)
			body.velocity.z = move_toward(body.velocity.z, 0, speed)

		body.move_and_slide()
	
func is_obstructed_above():
	if height_ray.is_colliding():
		return true
	return false
