extends CharacterBody2D

@onready var hard_drive = get_parent().get_node("HardDrive")
var mode: worker_mode
var bit_target
var collecting_bit = false
var move_speed = 1000
enum worker_mode 
{
	collect = 1,
	jump = 2
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mode = worker_mode.collect
	set_collision_mask_value(8, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mode == worker_mode.collect:
		collect_bits(delta)
		
		#if position.x != hard_drive.position.x and collecting_bit == false:
			#move_below_hard_drive()
		#else:
		
func move_below_hard_drive():
	position = position.move_toward(Vector2(hard_drive.position.x, position.y), 1)

func _on_coin_collider_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("bit"):
		bit_target = null
		body.queue_free()
		get_parent().score_manager.add_score(1)

func collect_bits(delta_time) -> void:
	
	if bit_target != null:
		position = position.move_toward(Vector2(bit_target.get_global_position().x, position.y), delta_time * move_speed)
	else:
		bit_target = get_tree().get_first_node_in_group("bits")
