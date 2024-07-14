extends Quest

func start(_data: Dictionary = {}):
	pass

## do call_quest_method(1, "update", [])
#func call_quest_method(quest_id: int, method: String, args: Array) -> void:

func update(_data: Dictionary = {}):
	
	if quest_item_count <= quest_item_needed:
		quest_item_count += 1
		
		print("Amount NEEDED : " , quest_item_needed - quest_item_count)
		print("COLLECTED : " , quest_item_count)
	else:		
		quest_item_count += 1
		quest_status = QuestStatus.TO_RETURN
		# The quest objective will automatically be set to true when calling update
		objective_completed = true		
		Shortcuts.complete_quest("get_apples")
		#QuestSystem.active.remove_quest(self) 
		QuestSystem.completed.add_quest(self)
		QuestSystem.emit_signal("quest_completed", self)
		print("Quest_completed !! %s" % quest_status)
		
	

func complete(_data: Dictionary = {}):
	if quest_status == QuestStatus.TO_RETURN:
		quest_status = QuestStatus.COMPLETED
		quest_item_count = 0
