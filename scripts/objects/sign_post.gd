class_name SignPost extends Node2D

@onready var interaction: Area2D = $Area2D


func _ready() -> void:
	interaction.area_entered.connect(_on_area_entered)
	interaction.area_exited.connect(_on_area_exit)
	pass
	
func player_interact() -> void:
	print("Will trigger dialogue manager")
	pass

func _on_area_entered(_a: Area2D) -> void:
	PlayerManager.interact_pressed.connect(player_interact)
	pass

func _on_area_exit(_a: Area2D) -> void:
	PlayerManager.interact_pressed.disconnect(player_interact)
	pass
	


