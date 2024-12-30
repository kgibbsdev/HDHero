extends Node
class_name OffScreenDestroyer

@export var VisibilityThingy: VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VisibilityThingy = get_node("VisibleOnScreenNotifier2D")
	update_configuration_warnings()
	
func _get_configuration_warnings():
	if VisibilityThingy == null:
		return ["This node requires a VisibleOnScreenNotifier2D!"]
	else:
		return []
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
