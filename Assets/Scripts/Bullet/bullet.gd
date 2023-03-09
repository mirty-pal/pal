extends CharacterBody2D

var call_screen_exit = Callable(self, "_on_screen_exited")



func _ready():
	$VisibleOnScreenNotifier2D.connect("screen_exited", call_screen_exit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(Vector2(400 * delta, 0).rotated(rotation))
	

func _on_screen_exited():
	queue_free()
