extends Node

const PLAYER = preload("res://Player/player.tscn")
const INVENTORY_DATA : InventoryData = preload("res://GUI/Pause_menu/Inventory/player_inventory.tres")

signal interact_pressed

var player : Player
var player_spawned := false

func _ready() -> void:
	add_player_instance()
	
func add_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child(player)

func set_health(hp : int, max_hp : int)->void:
	player.max_hp = max_hp
	player.hp = hp
	player.update_hp(0)
	
func set_player_position(_new_pos : Vector2) -> void:
	player.global_position = _new_pos
	pass

func set_as_parent(_p : Node2D) -> void:
	if player.get_parent():
		player.get_parent().remove_child(player)
	_p.add_child(player)
	
func unparent_player(_p : Node2D) -> void:
	_p.remove_child(player)
	
	
	
