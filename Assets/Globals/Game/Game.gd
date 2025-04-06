extends Node
var player : Player
var playerUI : Control
var start_screen : Control
var start_screen_camera : Camera3D
var end_screen : Control
var esq_quit : EsqQuit

func init_game():
	randomize()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	start_screen_camera.current = true
	start_screen.visible = true
	playerUI.visible = false

func start():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	start_screen.visible = false
	playerUI.visible = true
	player.enable(true)

func end():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	player.enable(false)
	playerUI.visible = false
	end_screen.visible = true
