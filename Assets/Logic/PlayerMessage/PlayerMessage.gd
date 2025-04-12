extends Node
class_name PlayerMessage

@export var story_label : Label
@export var system_label : Label
@export var animation_player_story : AnimationPlayer
@export var animation_player_system : AnimationPlayer

func _ready() -> void:
	PlayerStory.player_message = self

func get_story_message(text : String):
	if animation_player_story.is_playing():
		animation_player_story.stop()
	animation_player_story.play("story_run_text")
	story_label.text = text

func get_system_message(text : String):
	system_label.visible = true
	if animation_player_system.is_playing():
		animation_player_system.stop()
	system_label.text = text
	animation_player_system.play("system_run_text")
