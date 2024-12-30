extends Node

var player_score = 0
@onready var score_label = get_node("ScoreLabel")
@onready var bit_limit_bar = $BitLimitBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(player_score)
	bit_limit_bar.value = get_tree().get_nodes_in_group("bits").size()
	
func add_score(value: float):
	print("score")
	player_score += value

func get_score():
	return player_score
