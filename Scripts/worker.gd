extends Character

@onready var hard_drive = get_parent().get_node("HardDrive")
var mode: worker_mode
var bit_target
var collecting_bit = false
@export var move_speed = 1
@export var worker_speed_mult = 2

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
func _physics_process(delta: float) -> void:
	move_speed = run_speed * (worker_speed_mult + core) * acceleration
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if mode == worker_mode.collect:
		collect_bits(delta)
		
		#if position.x != hard_drive.position.x and collecting_bit == false:
			#move_below_hard_drive()
		#else:
	move_and_slide()


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
