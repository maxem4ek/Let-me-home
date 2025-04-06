extends Node
class_name StoryMessageTrigger

@export_multiline var text = ""
@export var oneshot : bool = true
@export var door_to_unlock : DoorInteractor
var triggered : bool = false
	
func trigger():
	if triggered == false:
		if door_to_unlock != null:
			door_to_unlock.locked = false
		PlayerStory.send_story_message(text)
		if oneshot:
			triggered = true
