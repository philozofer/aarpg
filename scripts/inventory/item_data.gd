class_name ItemData extends Resource

@export var name: String = ""
@export_multiline var description: String = ""
@export var texture: Texture2D


@export_category("ItemUseEffects")
@export var effects: Array[ItemEffect]



func use() -> bool:
	if effects.size() == 0:
		return false
	for e in effects: 
		e.use()
	return true
	
	
		
	












