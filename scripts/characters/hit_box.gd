class_name HitBox extends Area2D

signal damaged(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready():	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func take_damage(damage: int) -> void:
	print("TakeDamage: ", damage)
	damaged.emit(damage)
	pass
