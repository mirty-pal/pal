extends Node2D
var scene = preload("res://Battle System/Battlebase.tscn")
var tempy = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	if(tempy):
		remove_child($SprWaiting);
		remove_child($obj_player);
		remove_child($SprGivin);
		var ins = scene.instantiate();
		add_child(ins);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
