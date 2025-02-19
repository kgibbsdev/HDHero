extends Control

@onready var worker_control_container_scene: PackedScene = load("res://Scenes/worker_control_container.tscn")

var workers = []
var workerCountLastFrame = 0

func _ready() -> void:
	pass
	
func add_worker_ui(worker):
#	Will changes to the workers be reflected here as well?
	workers.add(worker)
