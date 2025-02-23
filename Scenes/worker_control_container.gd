class_name WorkerControlContainer extends VFlowContainer

var worker_manager: WorkerManager

var worker_number_label: Label
var collect_mode_checkbutton: CheckButton
var hit_mode_checkbutton: CheckButton

var worker_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worker_number_label = get_node("WorkerNumberLabel")
	worker_number_label.text = "default_text"
	worker_manager = get_parent().get_parent().get_node("WorkerManager")
	collect_mode_checkbutton = get_node("CollectModeCheckbutton")
	hit_mode_checkbutton = get_node("HitModeCheckbutton")
	
	collect_mode_checkbutton.toggle_mode = true
	hit_mode_checkbutton.toggle_mode = true
	match worker_manager.get_worker_mode(worker_number):
		Global.worker_mode.collect:
			collect_mode_checkbutton.button_pressed = true
		Global.worker_mode.jump:
			hit_mode_checkbutton.button_pressed = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match worker_manager.get_worker_mode(worker_number):
		Global.worker_mode.collect:
			pass
		Global.worker_mode.jump:
			pass
		
func set_number_label(number):
	worker_number_label.text = "Worker #" + str(number)

func set_worker_number(number: int):
	worker_number = number
	set_number_label(number)
	
func _on_collect_mode_checkbutton_toggled(toggled_on: bool) -> void:
	collect_mode_checkbutton.button_pressed = toggled_on
	hit_mode_checkbutton.button_pressed = !toggled_on
	worker_manager.change_worker_mode(worker_number, Global.worker_mode.collect)


func _on_hit_mode_checkbutton_toggled(toggled_on: bool) -> void:
	hit_mode_checkbutton.button_pressed = toggled_on
	collect_mode_checkbutton.button_pressed = !toggled_on
	worker_manager.change_worker_mode(worker_number, Global.worker_mode.jump)
