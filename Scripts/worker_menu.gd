class_name WorkerMenu extends Control

@onready var worker_control_container_scene: PackedScene = load("res://Scenes/worker_control_container.tscn")
@onready var worker_manager: WorkerManager = get_parent().get_node("WorkerManager")

var workers = []
var workerCountLastFrame = 0
var worker_controls = []
func _ready() -> void:
	pass
	
func add_worker_ui(worker):
#	Will changes to the workers be reflected here as well?
	workers.append(worker)
	var worker_control = worker_control_container_scene.instantiate()
	add_child(worker_control, true)


func _on_spawn_worker_button_pressed() -> void:
	worker_manager.spawn_worker()
