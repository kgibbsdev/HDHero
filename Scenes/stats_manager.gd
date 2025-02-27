class_name StatsManager extends Node

@export var power = 1
@export var core = 1
@export var walk_speed = 150.0
@export var jump_force = -500.0
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var deceleration = 0.1
@export_range(0, 1) var decelerate_on_jump_release = 0.5

var run_speed = 250.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
