extends Node

@export var parent_door_interactor : Node3D
@export_multiline var text : String
@export var oneshot : bool = true
@export var opened_signal : bool = true
@export var closed_signal : bool = true
@export var hovered_signal : bool = true
@export var unhovered_signal : bool = true
@export var story_message_trigger : StoryMessageTrigger
@export var unlock_object : Node3D

var door_interactor : DoorInteractor

func _ready() -> void:
	door_interactor = parent_door_interactor.door_interactor
	story_message_trigger.text = text
	story_message_trigger.oneshot = oneshot
	if unlock_object != null:
		story_message_trigger.door_to_unlock = unlock_object.door_interactor
	door_interactor.opened.connect(func(): if opened_signal: story_message_trigger.trigger())
	door_interactor.closed.connect(func(): if closed_signal: story_message_trigger.trigger())
	door_interactor.hovered.connect(func(): if hovered_signal: story_message_trigger.trigger())
	door_interactor.unhovered.connect(func(): if unhovered_signal: story_message_trigger.trigger())
