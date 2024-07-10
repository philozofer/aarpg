class_name AddDialogueTo extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@onready var interaction: Area2D =  $"."

func _ready():
	interaction.area_entered.connect(_on_area_entered)
	interaction.area_exited.connect(_on_area_exit)

func player_interact() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pass

func _on_area_entered(_a: Area2D) -> void:
	PlayerManager.interact_pressed.connect(player_interact)
	pass

func _on_area_exit(_a: Area2D) -> void:
	PlayerManager.interact_pressed.disconnect(player_interact)
	pass
