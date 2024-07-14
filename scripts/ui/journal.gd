extends Panel

signal quest_selected

@onready var quest_list: ItemList = $QuestList
@onready var quest_description: RichTextLabel = $ColorRect2/Control/QuestDescription

func _ready():
	connect("quest_selected", _on_quest_list_item_selected )
	pass

func update_journal() -> void:	
	quest_list.clear() 	
		
	if QuestSystem.get_active_quests().size() > 0:			
		var active_quests = QuestSystem.get_active_quests()
		for quest in active_quests:			
			quest_list.add_item(quest.quest_name)	
		quest_description.text = ""		
		_on_quest_list_item_selected(0)	
	
func _on_quest_list_item_selected(_index: int) -> void:	
	var selected_quest_id = QuestSystem.get_active_quests()[_index]
	update_quest_description(QuestSystem.get_active_quests()[_index].quest_description)	
	
func update_quest_description(new_text: String) -> void:
	quest_description.text = new_text


