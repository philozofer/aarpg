class_name PersistentDataManager extends Node

signal data_loaded
var value: bool = false


func _ready():
	get_value()	
	pass
	
func set_value() -> void:
	SaveManager.add_persistent_value(_get_name())
	pass
	
func get_value() -> void:
	value = SaveManager.check_persistent_value(_get_name())
	data_loaded.emit()
	pass

func _get_name() -> String:
	return get_tree().current_scene.scene_file_path + "/" + get_parent().name





