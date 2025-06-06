extends Node

var current_tilemap_bounds : Array[Vector2]
signal TilemapBoundsChanged (bounds : Array[Vector2])

func change_tilemap_bounds(bounds : Array[Vector2]) ->void:
	current_tilemap_bounds = bounds
	TilemapBoundsChanged.emit(bounds)
