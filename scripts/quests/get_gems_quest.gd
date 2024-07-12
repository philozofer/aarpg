extends Quest

@export var items_needed: int = 3

func start(_data: Dictionary = {}):
	pass

## do call_quest_method(1, "update", [])
#func call_quest_method(quest_id: int, method: String, args: Array) -> void:

func update(_data: Dictionary = {}):
	if QuestStates.gem_count <= items_needed:
		QuestStates.gem_count += 1		
	else:		
		QuestStates.gem_count += 1
		QuestStates.gem_status = QuestStates.GEM_STATUS.HAS
		# The quest objective will automatically be set to true when calling update
		objective_completed = true		
		Shortcuts.complete_quest("get_gems")
		#QuestSystem.active.remove_quest(self)
		QuestSystem.completed.add_quest(self)
		QuestSystem.emit_signal("quest_completed", self)
		print("Quest_completed !! %s" % QuestStates.gem_status)
		
	print("Amount NEEDED : " , items_needed - QuestStates.gem_count)
	print("COLLECTED : " , QuestStates.gem_count)

func complete(_data: Dictionary = {}):
	if QuestStates.gem_status == QuestStates.GEM_STATUS.HAS:
		QuestStates.gem_status = QuestStates.GEM_STATUS.GAVE
		QuestStates.gem_count = 0
