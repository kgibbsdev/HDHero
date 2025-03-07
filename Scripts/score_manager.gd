extends Node

var player_score = 0
@onready var score_label = get_node("ScoreLabel")
@onready var bit_limit_bar = $BitLimitBar
@onready var bit_limit_bar_label = $BitLimitBar/Label
@onready var power_label = $PowerLabel
@onready var bit_manager: BitManager = get_parent().get_node("BitManager")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bit_limit_bar.max_value = bit_manager.get_bit_limit()
	var current_bits = get_tree().get_nodes_in_group("bits").size()
	score_label.text = str(player_score)
	bit_limit_bar.value = current_bits
	bit_limit_bar_label.text = "Bit Limit          " + str(current_bits) + " / " + str(Global.bit_limit)
	
func add_score(value: float):
	#print("score")
	player_score += value

func get_score():
	return player_score
