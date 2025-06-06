class_name State_Attack extends State

var attacking := false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelarate_speed := 5.0
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var walk: State = $"../walk"
@onready var idle: State = $"../idle"
@onready var hurt_box: HurtBox = %AttackHurtBox


func enter() -> void:
	player.update_animation("attack")
	attack_anim.play("attack_" + player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.2)
	audio.play()
	attacking = true
	await get_tree().create_timer(0.15).timeout
	hurt_box.monitoring = true

func exit() -> void :
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	hurt_box.monitoring = false

func process(_delta : float ) -> State:
	player.velocity -= player.velocity * decelarate_speed * _delta
	if !attacking:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
func physics(_delta : float) -> State:
	return null
	
func handle_input(_event : InputEvent) -> State:
	return null

func end_attack(_new_anim_name : String) -> void:
	attacking = false
