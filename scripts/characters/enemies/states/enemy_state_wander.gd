class_name EnemyStateWander extends EnemyState

@export var anim_name: String = "walk"
@export var walk_speed: float = 20.0

@export_category("AI")
@export var state_duration_duration: float = 0.5
@export var state_anim_cycles_min: int = 1
@export var state_anim_cycles_max: int = 4
@export var next_state: EnemyState

var _timer: float = 0.0
var _direction: Vector2


func init() -> void:	
	pass

func enter() -> void:
	_timer = randi_range(state_anim_cycles_min, state_anim_cycles_max) * state_duration_duration
	var rand = randi_range(0,3)
	_direction = enemy.DIR_4[rand]
	enemy.velocity = _direction * walk_speed
	enemy.set_direction(_direction)
	enemy.update_animation(anim_name)
	pass
	
func exit() -> void:
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(_delta: float) -> EnemyState:
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null

func physics(_delta: float) -> EnemyState:
	return null
