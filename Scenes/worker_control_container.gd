class_name WorkerControlContainer extends VFlowContainer

@onready var worker_number_label: Label = get_node("WorkerNumberLabel")
var worker_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worker_number_label.text = "test"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
