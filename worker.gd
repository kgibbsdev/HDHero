extends CharacterBody2D

@onready var hard_drive = get_parent().get_node("HardDrive")
var mode: worker_mode

enum worker_mode 
{
	collect = 1,
	jump = 2
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mode = worker_mode.collect
	set_collision_mask_value(8, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mode == worker_mode.collect and position.x != hard_drive.position.x:
		move_below_hard_drive()
		
func move_below_hard_drive():
	position = position.move_toward(Vector2(hard_drive.position.x, position.y), 1)


func _on_coin_collider_body_entered(body: Node2D) -> void:
	if body.name.to_lower().contains("bit"):
		body.queue_free()
		get_parent().score_manager.add_score(1)
