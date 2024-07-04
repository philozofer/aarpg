class_name PlayerCamera extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelManager.TileMapBoundsChanged.connect(updateLimits)
	updateLimits(LevelManager.current_tilemap_bounds)
	pass # Replace with function body.


func updateLimits(bounds: Array[Vector2]) -> void:
	if bounds == []:
		return	
	limit_left = int(bounds[0].x)
	limit_top = int(bounds[0].y)
	limit_right = int(bounds[1].x)
	limit_bottom = int(bounds[1].y)
	pass
