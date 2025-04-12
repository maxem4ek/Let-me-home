extends Node
var player : Player
var playerUI : Control
var start_screen : Control
var start_screen_camera : Camera3D
var end_screen : Control
var state = 0

func init_game():
	randomize()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	start_screen_camera.current = true
	start_screen.visible = true
	playerUI.visible = false
	state = 1

func start():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	start_screen.visible = false
	playerUI.visible = true
	player.enable(true)
	state = 2

func end():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	player.enable(false)
	playerUI.visible = false
	end_screen.visible = true
	state = 3
	

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if state == 2:
			if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
