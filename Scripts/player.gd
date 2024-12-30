extends CharacterBody2D
 
@export var walk_speed = 150.0
@export var run_speed = 250.0
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var deceleration = 0.1
 
@export var jump_force = -500.0
@export_range(0, 1) var decelerate_on_jump_release = 0.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
 
	var speed = run_speed
 
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
 
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_force
 
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
 
	move_and_slide()

func _on_hard_drive_body_entered(body: Node2D) -> void:
	velocity.y = 0
	velocity.x = 0
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("bit"):
		print(body.name)
		body.queue_free()
		get_parent().score_manager.add_score(1)
		
