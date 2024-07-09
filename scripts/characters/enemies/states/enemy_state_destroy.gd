class_name EnemyStateDestroy extends EnemyState

@export var anim_name: String = "destroy"
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 10.0

@export_category("AI")

var _damage_position: Vector2
var _direction: Vector2

func init() -> void:
	enemy.enemy_destroyed.connect(_on_enemy_destroyed)
	pass

func enter() -> void:
	enemy.invulnerable = true
	_direction = enemy.global_position.direction_to(_damage_position)
	enemy.set_direction(_direction)
	enemy.velocity = _direction * -knockback_speed	
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	disable_hurt_box()
	pass
	
func exit() -> void:	
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(_delta: float) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

func physics(_delta: float) -> EnemyState:
	return null
	
func _on_enemy_destroyed(hurt_box: HurtBox) -> void:
	_damage_position = hurt_box.global_position
	state_machine.change_state(self)
	pass

func _on_animation_finished(_a: String) -> void:
	enemy.queue_free()
	pass


func disable_hurt_box() -> void:
	var hurt_box: HurtBox = enemy.get_node_or_null("HurtBox")
	if hurt_box:
		hurt_box.monitoring = false
