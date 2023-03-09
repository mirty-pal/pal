extends CharacterBody2D


func _ready():
	$VisibleOnScreenNotifier2D.connect("screen_exited", _on_screen_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(Vector2(400 * delta, 0).rotated(rotation))
	

func _on_screen_exited():
	queue_free()
