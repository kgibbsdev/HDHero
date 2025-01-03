extends Node

@onready var bit_scene: PackedScene = load("res://bit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_bit():
	var bit = bit_scene.instantiate()
	bit.get_node("AnimatedSprite2D").play()
	add_child(bit, true)
	bit.set_position(Vector2.ZERO)
	call_deferred("_apply_impulse_to_body", bit)
	
func _apply_impulse_to_body(body: RigidBody2D) -> void:
	# Apply the impulse after the body is integrated into the physics system
	var x_force = randi_range(-100, 100)
	var y_force = randi_range(-500, -800)
	body.apply_impulse(Vector2(x_force, y_force), Vector2.ZERO)
