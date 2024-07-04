class_name State_Idle extends State

@onready var walk = $"../Walk"

## What happens when the player enters this State ?
func enter() -> void:
	player.updateAnimation("idle")
	pass
	
## What happens when the player exits this State ?
func exit() -> void:
	pass

## What happens during the _physics_process in this State ?
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process in this State ?
func physics(_delta: float) -> State:
	return null
	
## What happens when the player enters this State ?
func handleInput(_event: InputEvent) -> State:
	return null
	
