extends Node3D

@export var area3D : Area3D

func _ready() -> void:
	area3D.body_entered.connect(func(body): end_game(body))
	
func end_game(body):
	if body is Player:
		Game.end()
