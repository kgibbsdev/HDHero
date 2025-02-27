extends Control

@onready var increase_bit_limit_button = $VBoxContainer/IncreaseBitLimitButton
@onready var bit_manager: BitManager = get_parent().get_node("BitManager")

var workers = []
var bit_amount_increase_increment = 100

func _on_increase_bit_limit_button_pressed() -> void:
	print("_on_increase_bit_limit_button_pressed")
	bit_manager.increase_bit_limit(bit_amount_increase_increment)
	
func _on_increase_power_button_pressed() -> void:
	print("_on_increase_power_button_pressed")
	Global.power += 1
