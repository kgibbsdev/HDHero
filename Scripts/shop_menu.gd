extends Control

@onready var increase_bit_limit_button = $VBoxContainer/IncreaseBitLimitButton
@onready var hire_worker_button = $VBoxContainer/HireWorkerButton

@onready var current_worker_label = $VBoxContainer/WorkerContainer/CurrentWorkerLabel
@onready var worker_increase_core_button = $VBoxContainer/WorkerContainer/WorkerIncreaseCoreButton
@onready var worker_increase_power_button = $VBoxContainer/WorkerContainer/WorkerIncreasePowerButton

var current_worker: Character

func _ready():
	current_worker = get_parent().get_node("Worker")

func _change_current_worker(index: int) -> void:
	current_worker = Global.workers[index]

func _on_increase_bit_limit_button_pressed() -> void:
	print("_on_increase_bit_limit_button_pressed")
	Global.bit_limit += 100
	
func _on_increase_power_button_pressed() -> void:
	print("_on_increase_power_button_pressed")
	Global.power += 1


func _on_worker_increase_power_button_pressed() -> void:
	current_worker.power += 1


func _on_worker_increase_core_button_pressed() -> void:
	current_worker.core += 1
