class_name State extends Node

## Stores a reference to the player that this State belongs to
static var player: Player
static var state_machine: PlayerStateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init() -> void:
	pass
	
## What happens when the player enters this State ?
func enter() -> void:
	pass
	
## What happens when the player exits this State ?
func exit() -> void:
	pass

## What happens during the _physics_process in this State ?
func process(_delta: float) -> State:
	return null

## What happens during the _physics_process in this State ?
func physics(_delta: float) -> State:
	return null
	
## What happens when the player enters this State ?
func handle_input(_event: InputEvent) -> State:
	return null
	
