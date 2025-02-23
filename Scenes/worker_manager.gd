class_name WorkerManager extends Node2D

var workers = []
var default_spawn_point = Vector2(114, 362)
@onready var worker_scene: PackedScene = load("res://Scenes/worker.tscn")
@onready var worker_menu: WorkerMenu = get_parent().get_node("WorkerMenu")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_worker(provided_spawn_position: Vector2 = default_spawn_point):
	print("worker_manager > spawn_worker")
	var worker: Worker = worker_scene.instantiate()
	worker.position = default_spawn_point
	worker.mode = Global.worker_mode.collect
	workers.append(worker)
	
	add_child(worker)
	worker_menu.add_worker_ui(worker)
	
func get_worker_count():
	return len(workers)
	
func change_worker_mode(worker_number, mode):
	workers[worker_number].set_mode(mode)

func get_worker_mode(worker_number):
	return workers[worker_number].get_mode()
