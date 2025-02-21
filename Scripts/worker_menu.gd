class_name WorkerMenu extends Control

@onready var worker_control_container_scene: PackedScene = load("res://Scenes/worker_control_container.tscn")
@onready var worker_manager: WorkerManager = get_parent().get_node("WorkerManager")

var workers = []
var workerCountLastFrame = 0
var worker_controls = []
var spacing_base_x: int = 128
var spacing_base_y: int = 64
func _ready() -> void:
	pass
	
func add_worker_ui(worker):
#	Will changes to the workers be reflected here as well?
	workers.append(worker)
	var worker_control: WorkerControlContainer = worker_control_container_scene.instantiate()
#	Make sure to add a node to the tree before you set any of its values!
	worker_controls.append(worker_control)
	add_child(worker_control, true)

	worker_control.set_number_label("Worker #" + str(len(workers)))
	var spacing: Vector2 = Vector2((len(worker_controls) - 1) * spacing_base_x, position.y + spacing_base_y)
	worker_control.set_position(spacing)
	

func _on_spawn_worker_button_pressed() -> void:
	worker_manager.spawn_worker()
