extends AudioStreamPlayer3D
class_name StepSoundPlayer

@export var target : CharacterBody3D
@export var velocity_treshold : float = 1
@export var sounds : Array[AudioStream]
@export var step_interval : float = 0.5
@export var timer : Timer

var counter : int = 0
var can_play = true
var enabled : bool

func _ready() -> void:
	timer.wait_time = step_interval
	timer.timeout.connect(func(): can_play = true)

func _physics_process(delta: float) -> void:
	if enabled:
		if target.is_on_floor():
			if target.velocity.length() > velocity_treshold and can_play:
				play_step()

func play_step():
	stream = sounds[counter]
	counter += 1
	if counter > sounds.size() - 1:
		counter = 0
		sounds.shuffle()
	play()
	timer.start()
	can_play = false
