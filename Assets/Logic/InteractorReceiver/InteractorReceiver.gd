extends Area3D

class_name InteractorReceiver

signal hovered
signal unhovered
signal used


func interactor_hover():
	emit_signal("hovered")
	
func interactor_unhover():
	emit_signal("unhovered")
	
func interactor_use():
	emit_signal("used")
