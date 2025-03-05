class_name BitManager extends Node2D

@onready var bit_scene: PackedScene = load("res://Scenes/bit.tscn")
@export var bit_limit = 100
@export var bit_value_min = 1
@export var bit_value_max = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func spawn_bit(spawn_position):
	if get_tree().get_nodes_in_group("bits").size() < bit_limit:
		var bit = bit_scene.instantiate()
		bit.get_node("AnimatedSprite2D").play()
		bit.add_to_group("bits")
		bit.position = to_global(spawn_position)
		bit.get_node("VisibleOnScreenNotifier2D").connect("screen_exited", check_if_deletable.bind(bit))
		set_bit_value(bit)
		set_bit_color(bit)
		add_child(bit, true)
		call_deferred("_apply_impulse_to_body", bit)
	else:
		print("too many bits!")

func _apply_impulse_to_body(body: RigidBody2D) -> void:
	# Apply the impulse after the body is integrated into the physics system
	var x_force = randi_range(-100, 100)
	var y_force = randi_range(-500, -800)
	body.apply_impulse(Vector2(x_force, y_force), Vector2.ZERO)

func check_if_deletable(bit):
#	Allow bits to go off of the top of the screen and come back down but die if they fall off the map
	if bit.get_position().y < 0:
		pass
	else:
		bit.queue_free()

func increase_bit_limit(amount: int):
	bit_limit += amount

func get_bit_limit():
	return bit_limit

func set_bit_color(bit_instance):
	var val = bit_instance.get_meta("value")
	var sprite = bit_instance.get_node("AnimatedSprite2D")
	sprite.material = sprite.material.duplicate()
	print(val)
	match val:
		1: sprite.material.set_shader_parameter("overlay_color", Color(1, 1, 1, 1))
		2: sprite.material.set_shader_parameter("overlay_color", Color(0, 1, 0, 1))
		3: sprite.material.set_shader_parameter("overlay_color", Color(1, 0, 1, 1))
		_: print("default!!")
		
func set_bit_value(bit_instance):
	var val = randi_range(bit_value_min, bit_value_max)
	bit_instance.set_meta("value", val)
