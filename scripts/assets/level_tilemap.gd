class_name LevelTileMap extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	LevelManager.changeTilemapBounds(getTilemapBounds())
	pass # Replace with function body.

func getTilemapBounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = []
	bounds.append(
		Vector2(get_used_rect().position * rendering_quadrant_size)
	)
	bounds.append(
		Vector2(get_used_rect().end * rendering_quadrant_size)
	)
	return bounds
