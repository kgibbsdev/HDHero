extends Node2D

#Set spawn position a little higher than the harddrive for now to stop player from 
#auto-collecting bits when they headbutt the drive
var bit_spawn_position = Vector2(position.x, position.y + 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		#print("input")
		for x in Global.power:
			spawn_bit(bit_spawn_position)

func _apply_impulse_to_body(body: RigidBody2D) -> void:
	# Apply the impulse after the body is integrated into the physics system
	var x_force = randi_range(-100, 100)
	var y_force = randi_range(-500, -800)
	body.apply_impulse(Vector2(x_force, y_force), Vector2.ZERO)

func _on_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("player") or body.name.to_lower().contains("worker"):
		spawn_bit(bit_spawn_position)
		
func spawn_bit(spawn_position = Vector2(0, 0)):
	get_parent().get_node("BitManager").spawn_bit(spawn_position)
