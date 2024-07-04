class_name State_Walk extends State

@export var move_speed: float = 100.0
@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"


## What happens when the player enters this State ?
func enter() -> void:
	player.updateAnimation("idle")
	pass
	
## What happens when the player exits this State ?
func exit() -> void:
	pass

## What happens during the _physics_process in this State ?
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.setDirection():
		player.updateAnimation("walk")		
	return null

## What happens during the _physics_process in this State ?
func physics(_delta: float) -> State:
	return null
	
## What happens when the player enters this State ?
func handleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
	
