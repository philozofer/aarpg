extends Quest

@export var gems_needed: int = 3

func start(_data: Dictionary = {}):
	pass

## do call_quest_method(1, "update", [])
#func call_quest_method(quest_id: int, method: String, args: Array) -> void:

func update(_data: Dictionary = {}):
	print(QuestStates.gem_count)
	if QuestStates.gem_count < gems_needed:
		QuestStates.gem_count += 1
		print(QuestStates.gem_count)
	else:
		QuestStates.gem_count += 1
		QuestStates.gem_status = QuestStates.GEM_STATUS.HAS
		# The quest objective will automatically be set to true when calling update
		objective_completed = true

func complete(_data: Dictionary = {}):
	if QuestStates.gem_status == QuestStates.GEM_STATUS.HAS:
		QuestStates.gem_status = QuestStates.GEM_STATUS.GAVE
		QuestStates.gem_count = 0
