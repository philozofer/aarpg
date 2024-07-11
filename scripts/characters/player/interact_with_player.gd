class_name InteractWithPlayer extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@onready var interaction: Area2D =  $"."

func _ready():
	interaction.area_entered.connect(_on_area_entered)
	interaction.area_exited.connect(_on_area_exit)

func player_interact() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
	
	#var quest = quest_resource
	##print(quest)
	#if quest and quest.status != "complete":
		### Check quest conditions here, if met:
		#if check_quest_conditions(quest):
			#DialogueManager.show_dialogue_balloon(dialogue_resource, quest_start)
		#else:
			# Handle case where quest conditions are not met
			#pass  # Or do something else
				
	#else:
		#DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)	

func check_quest_conditions(_quest: Quest) -> bool:
	# Implement your quest condition checks here
	# Return true if conditions are met, false otherwise
	return true
	

func _on_area_entered(_a: Area2D) -> void:
	PlayerManager.interact_pressed.connect(player_interact)

func _on_area_exit(_a: Area2D) -> void:
	PlayerManager.interact_pressed.disconnect(player_interact)
