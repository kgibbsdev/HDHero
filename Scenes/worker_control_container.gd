class_name WorkerControlContainer extends VFlowContainer

var worker_number_label: Label
var worker_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worker_number_label = get_node("WorkerNumberLabel")
	worker_number_label.text = "default_text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_number_label(label_text):
	worker_number_label.text = label_text
