extends Node2D

var rect_scene = preload("res://Battle System/btl_tile.tscn");
# Called when the node enters the scene tree for the first time.
func _ready():
	print("I AM LOADED BITCH");
	print(get_viewport_rect().size);
	print(position)
	var resource = load("res://Dialogue/firstDialogue.dialogue");
	var line = await(DialogueManager.get_next_dialogue_line(resource))
	var balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn");
	balloon.dialogue = line;
	add_child(balloon);
	
	
	
	
