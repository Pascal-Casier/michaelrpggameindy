class_name State_Walk extends State

@export var move_speed :  float = 100.0

@onready var idle: State = $"../idle"
@onready var attack: State = $"../attack"


func enter() -> void:
	player.update_animation("walk")

func exit() -> void :
	pass

func process(_delta : float ) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	player.velocity = player.direction * move_speed
	if player.set_direction():
		player.update_animation("walk")
		
	return null
	
func physics(_delta : float) -> State:
	return null
	
func handle_input(_event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed("interact"):
		PlayerManager.interact_pressed.emit()
	return null
