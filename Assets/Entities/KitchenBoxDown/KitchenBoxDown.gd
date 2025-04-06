extends Node3D

@export var locked : bool = true :
	set(value):
		locked = value
		if door_interactor:
			door_interactor.locked = locked

@export var door_interactor : DoorInteractor
