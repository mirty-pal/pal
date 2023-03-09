extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_vector("Rotate Left", "Rotate Right", "Rotate Up", "Rotate Down").normalized() == Vector2.ZERO:
		look_at(get_global_mouse_position())
	else:
		rotation = Input.get_vector("Rotate Left", "Rotate Right", "Rotate Up", "Rotate Down").normalized().angle()
	
	set_flip_v(global_rotation > 1.5 || global_rotation < -1.5);
	$BulletSpawn.position.y = 300 if global_rotation > 1.5 || global_rotation < -1.5 else -200;
