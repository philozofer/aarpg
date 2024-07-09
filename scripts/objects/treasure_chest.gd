@tool
class_name TreasureChest extends Node2D

@export var item_data: ItemData : set = _set_item_data
@export var quantity: int = 1 : set = _set_quantity

var is_open: bool = false


@onready var sprite: Sprite2D = $Item
@onready var label: Label = $Item/Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interact_area: Area2D = $Area2D


func _ready() -> void:
	update_texture()
	update_label()
	
	if Engine.is_editor_hint():
		return
	
	interact_area.area_entered.connect(_on_area_entered)
	interact_area.area_exited.connect(_on_area_exit)
	pass


func player_interact() -> void:
	if is_open == true:
		return
	is_open = true
	animation_player.play("open_chest")
	if item_data and quantity > 0:
		PlayerManager.INVENTORY_DATA.add_item(item_data, quantity)
	else:
		printerr("No Items in Chest !")
		push_error("No Items in Chest Name : ", name)
	pass

func _on_area_entered(_a: Area2D) -> void:
	PlayerManager.interact_pressed.connect(player_interact)
	pass


func _on_area_exit(_a: Area2D) -> void:
	PlayerManager.interact_pressed.disconnect(player_interact)
	pass
	
# Called when the node enters the scene tree for the first time.
func _set_item_data(value: ItemData) -> void:
	item_data = value
	update_texture
	pass
	
func _set_quantity(value: int) -> void:
	quantity = value
	pass
	

func update_texture() -> void:
	if item_data and sprite:
		sprite.texture = item_data.texture
	pass


func update_label() -> void:
	if label:
		if quantity <= 1:
			label.text = ""
		else:
			label.text = "x" + str(quantity)
	pass
