extends Panel

@onready var journal: Panel = $"."
@onready var quest_list: ItemList = $QuestList
@onready var quest_description: RichTextLabel = $QuestDescription

@onready var quest_selected: Quest

func update_journal() -> void:	
	quest_list.clear()
	
	if QuestSystem.get_active_quests().size() > 0:			
		for i in QuestSystem.get_active_quests():
			print(i.quest_name)
			quest_list.add_item(i.quest_name)
			pass
	
	quest_description.text = ""	
	_on_journal_item_selected(0)
	quest_list.select(0)
	
	
func _on_journal_item_selected(index: int) -> void:
	# Assuming you want to select the first item:
	var first_item_index = quest_list.get_item_at_position(Vector2(0, 0))
	var selected_quest = quest_list.get_item(first_item_index)
	#quest_description.text = selected_quest.quest_description	
	update_quest_description(selected_quest.quest_description)	
	pass
	
func update_quest_description(new_text: String) -> void:
	quest_description.text = new_text


