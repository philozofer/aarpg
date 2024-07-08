class_name Plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.damaged.connect(take_damage)
	pass


func take_damage(hurt_box: HurtBox) -> void:
	queue_free()
	pass
