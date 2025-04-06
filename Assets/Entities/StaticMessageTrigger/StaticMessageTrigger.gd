extends Node3D

@export_multiline var  text : String
@export var oneshot : bool = true
@export var area3D : Area3D
@export var story_message_trigger : StoryMessageTrigger

func _ready() -> void:
	area3D.body_entered.connect(Callable(self, "_on_body_entered"))
	story_message_trigger.text = text
	story_message_trigger.oneshot = oneshot

func _on_body_entered(body):
	if body is Player:
		story_message_trigger.trigger()
		if oneshot:
			set_deferred("monitoring", false)
