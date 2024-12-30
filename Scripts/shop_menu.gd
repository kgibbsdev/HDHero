extends Control

@onready var increase_bit_limit_button = $VBoxContainer/IncreaseBitLimitButton
@onready var hire_worker_button = $VBoxContainer/HireWorkerButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_increase_bit_limit_button_pressed() -> void:
	print("_on_increase_bit_limit_button_pressed")
	Global.bit_limit += 100
	


func _on_increase_power_button_pressed() -> void:
	print("_on_increase_power_button_pressed")
	Global.power += 1
