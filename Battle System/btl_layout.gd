extends Node2D

var rect_scene = preload("res://Battle System/btl_tile.tscn");
# Called when the node enters the scene tree for the first time.
func _ready():
	print("I AM LOADED BITCH");
	print(get_viewport_rect().size);
	print(position)
