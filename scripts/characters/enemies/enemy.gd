class_name Enemy extends CharacterBody2D

signal direction_changed(new_direction: Vector2)
signal enemy_damaged()

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@export var hp: int = 3

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

#@onready var hit_box: HitBox = $Hitbox
#@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(_delta):
	move_and_slide()
	

func set_direction() -> bool:	
	if direction == Vector2.ZERO:
		return false
	
	var direction_id: int = int(round((direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size()))
	var new_dir = DIR_4[direction_id]
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	#sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true




