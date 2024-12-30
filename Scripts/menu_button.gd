extends Sprite2D

@onready var upgrade_menu: PopupPanel = get_parent().get_node("UpgradeMenu")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("menu")
	upgrade_menu.show()


func _on_upgrade_menu_close_requested() -> void:
	upgrade_menu.hide()
