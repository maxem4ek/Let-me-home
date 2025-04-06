extends Node

var tapes_find = [false, false, false, false, false]
var player_message : PlayerMessage

signal tape_finded(number)

func collect_tape(number):
	tapes_find[number-1] = true
	emit_signal("tape_finded", number)

func send_story_message(text : String):
	if player_message != null:
		player_message.get_story_message(text)
 	
func send_sys_message(text : String):
	if player_message != null:
		player_message.get_system_message(text)
