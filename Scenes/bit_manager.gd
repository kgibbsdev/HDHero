extends Node2D

@onready var bit_scene: PackedScene = load("res://Scenes/bit.tscn")
@export var number_of_bits = 0
@export var bit_limit = Global.bit_limit
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_bit(posish = Vector2(0, 0)):
	print("doink")
	if get_tree().get_nodes_in_group("bits").size() < bit_limit:
		var bit = bit_scene.instantiate()
		bit.get_node("AnimatedSprite2D").play()
		bit.add_to_group("bits")
		bit.position = to_local(posish)
		add_child(bit, true)
		number_of_bits += 1
		call_deferred("_apply_impulse_to_body", bit)
	else:
		print("too many bits!")

func _apply_impulse_to_body(body: RigidBody2D) -> void:
	# Apply the impulse after the body is integrated into the physics system
	var x_force = randi_range(-100, 100)
	var y_force = randi_range(-500, -800)
	body.apply_impulse(Vector2(x_force, y_force), Vector2.ZERO)
