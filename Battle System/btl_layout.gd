extends Node2D

var rect_scene = preload("res://Battle System/btl_tile.tscn");
# Called when the node enters the scene tree for the first time.
func _ready():
	print("I AM LOADED BITCH");
	for y in range(5):
		for x in range(5):
			var rec = rect_scene.instantiate();
			rec.position = Vector2(x*25,y*25)
			print(rec.position);
			add_child(rec);
			
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_key_pressed(KEY_SHIFT)):
		print(get_global_mouse_position())
