@tool
class_name ItemPickup extends CharacterBody2D

@export var item_data: ItemData: set = _set_item_data

@onready var area: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	update_texture()
	if Engine.is_editor_hint():
		return
	area.body_entered.connect(_on_body_entered)	


func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	velocity -= velocity * delta * 4
			

func _on_body_entered(b) -> void:
	if b is Player:
		if item_data:			
			if PlayerManager.INVENTORY_DATA.add_item(item_data) == true:
				item_picked()
				QuestSystem.emit_signal("item_picked_up", item_data)
				

func item_picked() -> void:
	area.body_entered.disconnect(_on_body_entered)
	audio_stream_player.play()
	visible = false
	await audio_stream_player.finished
	queue_free()		

func _set_item_data(value: ItemData) -> void:
	item_data = value
	update_texture()

func update_texture() -> void:
	if item_data and sprite:
		sprite.texture = item_data.texture
	pass
