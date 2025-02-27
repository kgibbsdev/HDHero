extends CharacterBody2D

@onready var stats: StatsManager = get_node("StatsManager")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += stats.gravity * delta
		
	var speed = stats.run_speed
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * stats.acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, stats.walk_speed * stats.deceleration)

	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		velocity.y = stats.jump_force
 
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= stats.decelerate_on_jump_release
		
	move_and_slide()
	
func _on_hard_drive_body_entered(body: Node2D) -> void:
	velocity.y = 0
	velocity.x = 0
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("bit"):
		#print(body.name)
		body.queue_free()
		get_parent().score_manager.add_score(1)
		
