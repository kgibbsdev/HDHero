class_name WorkerControlContainer extends VFlowContainer

var worker_manager: WorkerManager

var worker_number_label: Label
var collect_mode_checkbox: CheckBox
var hit_mode_checkbox: CheckBox

var worker_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worker_number_label = get_node("WorkerNumberLabel")
	worker_number_label.text = "default_text"
	worker_manager = get_parent().get_parent().get_node("WorkerManager")
	collect_mode_checkbox = get_node("CollectModeCheckbox")
	hit_mode_checkbox = get_node("HitModeCheckbox")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_number_label(number):
	worker_number_label.text = "Worker #" + str(number)

func set_worker_number(number: int):
	worker_number = number
	set_number_label(number)
	
func _on_collect_mode_checkbox_toggled(toggled_on: bool) -> void:
	collect_mode_checkbox.toggle_mode = toggled_on
	hit_mode_checkbox.toggle_mode = !toggled_on
	hit_mode_checkbox.toggled.emit()
	worker_manager.change_worker_mode(worker_number, Global.worker_mode.collect)


func _on_hit_mode_checkbox_toggled(toggled_on: bool) -> void:
	hit_mode_checkbox.toggle_mode = toggled_on
	worker_manager.change_worker_mode(worker_number, Global.worker_mode.jump)
	collect_mode_checkbox.toggle_mode = !toggled_on
	collect_mode_checkbox.toggled.emit()
