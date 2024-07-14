extends CanvasLayer

signal quests_menu_shown
signal quests_menu_hidden

#@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer
#@onready var button_save: Button = $Control/VBoxContainer/Button_Save
#@onready var button_load: Button = $Control/VBoxContainer/Button_Load
#@onready var quest_description: RichTextLabel = $Control/Journal/QuestDescription
@onready var journal: Panel = $Control/Journal
#@onready var quest_list: ItemList = $Control/Journal/QuestList

var is_paused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_quests_menu()	
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("quests"):
		if is_paused == false:
			show_quests_menu()
			journal.update_journal()
		else:
			hide_quests_menu()
		get_viewport().set_input_as_handled()
		
func show_quests_menu() -> void:
	get_tree().paused = true;
	visible = true
	is_paused = true
	quests_menu_shown.emit()
	
func hide_quests_menu() -> void:
	get_tree().paused = false;
	visible = false
	is_paused = false
	quests_menu_hidden.emit()
