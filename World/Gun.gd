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
