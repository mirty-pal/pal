extends CharacterBody2D
var curvelocity = Vector2.ZERO
@onready var player = get_node("%Player")

func _on_timer_timeout():
	print("timer go brr")
	curvelocity = Vector2(50, 0).rotated(get_angle_to(player.position))

func _physics_process(delta):
	velocity = curvelocity
	move_and_slide();
