extends Control

@onready var increase_bit_limit_button = $VBoxContainer/IncreaseBitLimitButton
@onready var current_worker_label = $VBoxContainer/WorkerContainer/CurrentWorkerLabel
@onready var worker_increase_core_button = $VBoxContainer/WorkerContainer/WorkerIncreaseCoreButton
@onready var worker_increase_power_button = $VBoxContainer/WorkerContainer/WorkerIncreasePowerButton

var workers = []

@onready var collect_checkbox = $VBoxContainer/WorkerContainer/CollectModeCheckbox
@onready var hit_checkbox = $VBoxContainer/WorkerContainer/HitModeCheckbox

func _on_increase_bit_limit_button_pressed() -> void:
	print("_on_increase_bit_limit_button_pressed")
	Global.bit_limit += 100
	
func _on_increase_power_button_pressed() -> void:
	print("_on_increase_power_button_pressed")
	Global.power += 1

func _on_collect_mode_checkbox_pressed() -> void:
	collect_checkbox.toggle_mode = true
	get_node("VBoxContainer/WorkerContainer/HitModeCheckbox").toggle_mode = false
	var workers = get_tree().get_nodes_in_group("Workers")
	for worker in workers:
		worker.set_mode(Global.worker_mode.collect)

func _on_hit_mode_checkbox_pressed() -> void:
	hit_checkbox.toggle_mode = true
	get_node("VBoxContainer/WorkerContainer/CollectModeCheckbox").toggle_mode = false
	var workers = get_tree().get_nodes_in_group("Workers")
	for worker in workers:
		worker.set_mode(Global.worker_mode.jump)
