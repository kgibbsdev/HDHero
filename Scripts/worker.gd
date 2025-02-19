extends Character

@onready var hard_drive = get_parent().get_node("HardDrive")
@onready var jump_timer = $JumpTimer
@export  var mode: Global.worker_mode
@export var move_speed = 0
@export var worker_speed_mult = 2
@export var jump_timer_amount = 1
@export var jump_force = -6000.0

var bit_target
var collecting_bit = false
var can_jump = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run_speed = 300
	#mode = worker_mode.collect
	jump_timer.wait_time = jump_timer_amount
	#set_collision_mask_value(8, true)
	set_collision_mask_value(2, true)
	set_collision_mask_value(10, true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	move_speed = run_speed * (worker_speed_mult + core) * acceleration
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		#velocity.y = jump_force
 #
	#if Input.is_action_just_released("jump") and velocity.y < 0:
		#velocity.y *= decelerate_on_jump_release
	
	if mode == Global.worker_mode.collect:
		collect_bits(delta)
	
	if mode == Global.worker_mode.jump:
		if position.x != hard_drive.position.x:
			move_below_hard_drive(delta)
		elif can_jump:
			jump()
			can_jump = false
			jump_timer.start()
		else:
			pass
			#print("doing nothing")
			
	if velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
	move_and_slide()

func set_mode(new_mode: Global.worker_mode):
	mode = new_mode

func _on_coin_collider_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("bit") and mode == Global.worker_mode.collect:
		bit_target = null
		body.queue_free()
		get_parent().score_manager.add_score(1)

func collect_bits(delta_time) -> void:
	if bit_target != null:
		position = position.move_toward(Vector2(bit_target.get_global_position().x, position.y), delta_time * move_speed)
	else:
		bit_target = get_tree().get_first_node_in_group("bits")

func move_below_hard_drive(delta_time):
	#print(move_speed)
	position.x = move_toward(position.x, hard_drive.get_global_position().x, move_speed * delta_time)

func jump():
	if is_on_floor():
		#print("jumping " + Time.get_datetime_string_from_system(false, false))
		velocity.y = jump_force
	
func _on_jump_timer_timeout() -> void:
	can_jump = true
	
func _on_hard_drive_body_entered(body: Node2D) -> void:
	velocity.y = 0
	velocity.x = 0
