class_name Plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect(take_damage)
	pass


func take_damage(_damage: int) -> void:
	queue_free()
	pass
