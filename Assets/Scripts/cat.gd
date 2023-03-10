extends CharacterBody2D

var hspd = 0;
var vspd = 0;
var pSpd = 2;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	hspd = Input.get_axis("Move Left","Move Right");
	vspd = Input.get_axis("Move Up","Move Down");
	velocity = Vector2(hspd, vspd).normalized() * pSpd * 50;
	move_and_slide();

	if velocity.x > 0:
		$AnimatedSprite2D.scale.x = 1
	elif velocity.x < 0:
		$AnimatedSprite2D.scale.x = -1



func _process(delta):
	pass
