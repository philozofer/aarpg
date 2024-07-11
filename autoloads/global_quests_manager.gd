extends Node

signal quest_accepted
signal quest_started
signal quest_selected
signal quest_loaded

var quests = {}

func _ready():
	DialogueManager.connect("quest_accepted", _on_quest_accepted)
	pass

func _on_quest_accepted(quest):
	print(quest)
	#quests[quest.id] = quest  # Assuming quests have unique IDs
	# Other initialization logic for the quest
	
func add_quest():
	#quest.status = "accepted"
	#quests.append(self)
	print("Quest was added")
	
func get_quest(quest_id: String) -> Quest:
	return quests[quest_id]

func update_quest(_quest_id: String, _obj_index: int, _sstatus: String):
	pass


func quest_load() -> void:
	pass
	
func quest_start() -> void:
	pass

func quest_step() -> void:
	pass
	
func quest_complete() -> void:
	pass

func quest_fail() -> void:
	pass
	
func quest_cancel() -> void:
	pass

func quest_track() -> void:
	pass
